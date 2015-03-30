class PartnerOffersHistoric < ActiveRecord::Base
  belongs_to :partner_offer
  belongs_to :user
  validates_presence_of :user
  validates_presence_of :partner_offer

  def as_json(options={})
    {
        id: id,
        user: user,
        offer: partner_offer
    }
  end

end
