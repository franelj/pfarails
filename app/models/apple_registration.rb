class AppleRegistration < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  validates :user, uniqueness: true
  validates_presence_of :device_token

  def as_json(options={})
    {
        id: id,
        user: user,
        device_token: device_token
    }
  end
end
