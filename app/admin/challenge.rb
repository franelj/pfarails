ActiveAdmin.register Challenge do
  permit_params :active, :latitude, :longitude, :user1_id, :user2_id

  form do |f|
    inputs 'Informations' do
      input :latitude
      input :longitude
      input :user1
      input :user2
      input :active, as: :select, collection: { "Actif" => 1, "Terminé" => nil }
    end
    actions
  end

  index do
    column :id
    column :user1
    column :user2
    column :active
    column :latitude
    column :longitude
    column :created_at
    actions
  end

  filter :user1
  filter :user2
  filter :latitude
  filter :longitude
  filter :active, as: :select, collection: { "Actif" => 1, "Terminé" => nil }
  filter :created_at
end
