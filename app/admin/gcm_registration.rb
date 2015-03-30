ActiveAdmin.register GcmRegistration do
  permit_params :user_id, :registration_id

  form do |f|
    inputs 'Informations' do
      input :user_id
      input :registration_id
    end
    actions
  end

  index do
    column :id
    column :user
    column :registration_id
    column :created_at
    actions
  end

  filter :user
  filter :registration_id
  filter :created_at
end
