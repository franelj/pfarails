class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
    t.string :latitude, null: false
    t.string :longitude, null: false
    t.integer :active, default: 1
    t.references :user1, null: false
    t.references :user2, null: false

    t.timestamps
    end

    add_index :challenges, [:user1_id, :active], unique: true
    add_index :challenges, [:user2_id, :active], unique: true
  end
end