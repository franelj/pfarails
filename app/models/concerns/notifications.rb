module Notifications
  extend ActiveSupport::Concern
  require 'houston'

  included do
  end

  module ClassMethods
  end

  def notify_apple(alert, users)
    return if users.blank?
    notifications = []
    users.each do | user |
      notification = Houston::Notification.new(device: user.apple_registration.device_token)
      notification.alert = alert
      notification.sound = "default"
      notification.content_available = true
      notifications.push notification
    end
    APN.push(*notifications)
  end

  def notify_android(data, users)
    return if users.blank?
    registrations_ids = []
    users.each do | user | registrations_ids.push(user.gcm_registration.registration_id) end
    uri = URI.parse("https://android.googleapis.com/gcm/send")
    req = Net::HTTP::Post.new(uri.path)

    req.content_type = 'application/json'
    req.add_field('Authorization', 'key=' + Rails.application.secrets.gcm_api_key)
    req.body = {
        registration_ids: registrations_ids,
        data: data
    }.to_json

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.request(req)
  end

  def challenge_notifications
    title = "Nouveau défi"
    message = "Un autre utilisateur est dans votre zone"
    id_notif = 1
    alert = {
        action: {
            id: id_notif,
            challengeId: id,
            title: "Voir le défi"
        },
        title: title,
        body: message
    }
    data = {
        id: id_notif,
        title: title,
        challengeId: id,
        message: message
    }
    androids = []
    apples = []
    androids.push user1 unless user1.gcm_registration.nil?
    androids.push user2 unless user2.gcm_registration.nil?
    apples.push user1 unless user1.apple_registration.nil?
    apples.push user2 unless user2.apple_registration.nil?
    notify_android data, androids
    notify_apple alert, apples
  end

  def end_challenge_notifications(expired)
    title = "Défi terminé"
    message = "Le défi est terminé !"
    id_notif = 4
    alert = {
        action: {
            id: id_notif,
            challengeId: id,
            title: "Voir le défi",
            expired: expired
        },
        title: title,
        body: message
    }
    data = {
        id: id_notif,
        title: title,
        challengeId: id,
        message: message
    }
    androids = []
    apples = []
    androids.push user1 unless user1.gcm_registration.nil?
    androids.push user2 unless user2.gcm_registration.nil?
    apples.push user1 unless user1.apple_registration.nil?
    apples.push user2 unless user2.apple_registration.nil?
    notify_android data, androids
    notify_apple alert, apples
  end

  def chat_notifications
    users = chat_room.users.to_a.delete_if { |u| u == user}
    title = "Nouveau message de #{user.username}"
    id_notif = 3
    alert = {
        action: {
            id: id_notif,
            chatRoomId: chat_room.id,
            title: "Aller dans le chat"
        },
        title: title,
        body: message[0, 50]
    }
    data = {
        id: id_notif,
        title: title,
        chatRoomId: chat_room.id,
        userName: user.username,
        message: message[0, 50]
    }
    notify_android data, users.select { |u| not u.gcm_registration.nil? }
    notify_apple alert, users.select { |u| not u.apple_registration.nil? }
  end

  def commercial_notifications(offer)
    title = "Offre exclusive à proximité !"
    message = "Un de nos partenaire est à proximité, profitez d'une offre exclusive !"
    id_notif = 2
    alert = {
        action: {
            id: id_notif,
            offerId: offer.id,
            title: "Voir l'offre"
        },
        title: title,
        body: message
    }
    data = {
        id: id_notif,
        title: title,
        offerId: offer.id,
        message: message
    }
    notify_android data, [user] unless user.gcm_registration.nil?
    notify_apple alert, [user] unless user.apple_registration.nil?
  end
end
