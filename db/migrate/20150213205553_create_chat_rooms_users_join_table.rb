class CreateChatRoomsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :chat_rooms_users do |t|
      t.references :chat_room, null: false
      t.references :user, null: false
    end

    add_index :chat_rooms_users, :user_id
  end
end
