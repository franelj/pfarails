class GcmRegistration < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  validates :user, uniqueness: true
  validates_presence_of :registration_id

  def as_json(options={})
    {
        id: id,
        user: user,
        registration_id: registration_id
    }
  end
end
