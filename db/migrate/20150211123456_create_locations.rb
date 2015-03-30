class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :user, null: false, index: true
      t.string :latitude, null: false
      t.string :longitude, null: false

      t.timestamps null: false
    end
  end
end
