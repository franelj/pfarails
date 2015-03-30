ActiveAdmin.register PartnerOffer do
  permit_params :user_id, :latitude, :longitude, :content

  index do
    column :id
    column :user
    column :latitude
    column :longitude
    column :content
    column :created_at
    actions
  end

  form do |f|
    inputs 'Informations' do
      input :user_id
      input :latitude
      input :longitude
      input :content
    end
    actions
  end

  filter :user
  filter :latitude
  filter :longitude
  filter :content
  filter :created_at
end
