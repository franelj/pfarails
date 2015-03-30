class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.references :chat_room
      t.references :user
      t.text :message

      t.timestamps null: false
    end
  end
end
