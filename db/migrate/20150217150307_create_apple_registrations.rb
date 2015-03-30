class CreateAppleRegistrations < ActiveRecord::Migration
  def change
    create_table :apple_registrations do |t|
      t.references :user, unique: true, null: false, index: true
      t.text :device_token, unique: true, null: false

      t.timestamps null: false
    end
  end
end
