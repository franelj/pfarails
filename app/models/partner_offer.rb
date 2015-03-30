class PartnerOffer < ActiveRecord::Base
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :content
  validates_presence_of :user

  belongs_to :user
  has_many :partner_offers_historics

  def as_json(options={})
    {
        id: id,
        content: content,
        latitude: latitude,
        longitude: longitude,
        created_at: created_at,
        updated_at: updated_at
    }
  end
end
