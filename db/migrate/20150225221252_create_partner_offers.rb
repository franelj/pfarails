class CreatePartnerOffers < ActiveRecord::Migration
  def change
    create_table :partner_offers do |t|
      t.string :latitude, null: false
      t.string :longitude, null: false
      t.text :content, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
