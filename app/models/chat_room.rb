class ChatRoom < ActiveRecord::Base
  default_scope { includes(:users) }
  has_and_belongs_to_many :users
  has_many :chat_messages

  validates_presence_of :users

  def as_json(options={})
    {
        id: id,
        users: users,
        updated_at: updated_at,
        created_at: created_at
    }
  end
end
