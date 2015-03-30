class Location < ActiveRecord::Base
  include Notifications
  belongs_to :user
  after_create :process_location_comparison

  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :user

  def process_location_comparison
    return if user.offline? || user.photo.nil? || user.photo_model.nil? || user.is_in_challenge?

    current_point = {
        latitude: latitude.to_d,
        longitude: longitude.to_d
    }.geo_point

    # Process locations comparison with users for challenges
    apples = User.challengeable.joins(:apple_registration, :locations).where('locations.created_at >= ?', 2.minutes.ago).where.not(users: { id: user.id}).to_a
    gcms = User.challengeable.joins(:gcm_registration, :locations).where('locations.created_at >= ?', 2.minutes.ago).where.not(users: { id: user.id}).to_a
    previous_challenges = user.challenges.where('created_at >= ?', 15.minutes.ago)
    users = apples + gcms
    users.uniq!

    users.each do |u|
      next if u.is_in_challenge?
      do_next = false
      previous_challenges.each do | prev_challenge |
        if prev_challenge.users.include? u
          do_next = true
          break
        end
      end
      next if do_next
      user_point = {
          latitude: u.locations.last.latitude.to_d,
          longitude: u.locations.last.longitude.to_d
      }.geo_point

      dist = current_point.distance_to(user_point)
      if (dist.to_d <= 0.05)

        midpoint = current_point.midpoint_to user_point
        Challenge.create(user1: user, user2: u, latitude: midpoint.latitude, longitude: midpoint.longitude)
        break
      end
    end

    offers = PartnerOffer.all
    offers.each do |offer|
      offer_point = {
          latitude: offer.latitude.to_d,
          longitude: offer.longitude.to_d
      }.geo_point

      dist = current_point.distance_to(offer_point)
      if dist.to_d <= 0.1
        ofh = user.partner_offers_historics.all.map(&:partner_offer_id)
        unless ofh.include? offer.id
          commercial_notifications offer
          p = PartnerOffersHistoric.new(:user => user, :partner_offer => offer)
          p.save
        end
      end
    end
  end

  def as_json(options={})
    {
        id: id,
        latitude: latitude,
        longitude: longitude,
        created_at: created_at,
        updated_at: updated_at
    }
  end
end
