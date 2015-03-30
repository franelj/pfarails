class AddPhotoColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo, :string
    add_column :users, :photo_model, :string
  end
end
