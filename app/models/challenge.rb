class Challenge < ActiveRecord::Base
  include Notifications
  scope :active, -> { where(active: 1) }
  default_scope { includes(:user1, :user2) }
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  after_commit :notify, on: [:create]
  validates_presence_of :user1, :user2, :latitude, :longitude
  validate :validate_challenge

  def validate_challenge
    errors.add(:message, "Il faut deux utilisateurs différents pour démarrer un défi") unless user1 != user2
    other_challenges = Challenge.where('active = 1 AND (user1_id = ? OR user2_id = ? OR user1_id = ? OR user2_id = ?)', user1, user1, user2, user2)
    errors.add(:message, "Un des utilisateurs est déjà engagé dans un défi !") unless other_challenges.blank? || (other_challenges.length == 1 && other_challenges.take == self)
  end

  def notify
    challenge_notifications
  end

  def notify_end(expired)
    end_challenge_notifications(expired)
  end

  def users
    [user1, user2]
  end

  def as_json(options={})
    {
        id: id,
        active: active,
        user1: user1,
        user2: user2,
        latitude: latitude,
        longitude: longitude,
        created_at: created_at,
        updated_at: updated_at
    }
  end

  def self.expiring_challenge
    @challenges = Challenge.where('created_at <= ? AND active = ?', 5.minutes.ago, 1)
    @challenges.each do |c|
      c.active = nil
      c.save
      c.notify_end(true)
    end
  end
end
