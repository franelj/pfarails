class CreatePartnerOffersHistorics < ActiveRecord::Migration
  def change
    create_table :partner_offers_historics do |t|
      t.references :partner_offer, null: false
      t.references :user, null: false

      t.timestamps null: false
    end

    add_index :partner_offers_historics, :partner_offer_id
    add_index :partner_offers_historics, :user_id
  end
end
