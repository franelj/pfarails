class CreateGcmRegistrations < ActiveRecord::Migration
  def change
    create_table :gcm_registrations do |t|
      t.references :user, unique: true, null: false, index: true
      t.text :registration_id, unique: true, null: false

      t.timestamps null: false
    end
  end
end
