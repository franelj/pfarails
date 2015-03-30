ActiveAdmin.register AppleRegistration do
  permit_params :user_id, :device_token

  form do |f|
    inputs 'Informations' do
      input :user_id
      input :device_token
    end
    actions
  end

  index do
    column :id
    column :user
    column :device_token
    column :created_at
    actions
  end

  filter :user
  filter :device_token
  filter :created_at
end
