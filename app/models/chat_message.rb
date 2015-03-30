class ChatMessage < ActiveRecord::Base
  include Notifications
  default_scope { includes(:user) }
  belongs_to :chat_room
  belongs_to :user
  after_create :notify

  validates_presence_of :message, :chat_room, :user

  def as_json(options={})
    {
        id: id,
        message: message,
        user: user,
        updated_at: updated_at,
        created_at: created_at
    }
  end

  def notify
    chat_notifications
  end
end
