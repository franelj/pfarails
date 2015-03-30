ActiveAdmin.register Location do
  permit_params :user_id, :latitude, :longitude

  form do |f|
    inputs 'Informations' do
      input :user_id
      input :latitude
      input :longitude
    end
    actions
  end

  index do
    column :id
    column :user
    column :latitude
    column :longitude
    column :created_at
    actions
  end

  filter :user
  filter :latitude
  filter :longitude
  filter :created_at
end
