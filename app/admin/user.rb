ActiveAdmin.register User  do
  permit_params :username, :email, :password, :password_confirmation, :role, :photo, :photo_model

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

  index do
    column :id
    column :username
    column :email
    column :points
    column :photo
    column :photo_model
    column :role do |u|
      I18n.t("activerecord.attributes.user.roles.#{u.role}")
    end
    column :status do |u|
      I18n.t("activerecord.attributes.user.statuses.#{u.status}")
    end
    column :created_at
    actions
  end

  form do |f|
    inputs 'Informations' do
      input :username
      input :email
      input :password
      input :password_confirmation
      input :photo
      input :photo_model
      input :role, as: :select, collection: User.roles.map{|symbol, value| [I18n.t("activerecord.attributes.user.roles.#{symbol}"), symbol]}
      input :status, as: :select, collection: User.statuses.map{|symbol, value| [I18n.t("activerecord.attributes.user.statuses.#{symbol}"), symbol]}
    end
    actions
  end

  filter :username
  filter :email
  filter :points
  filter :role, as: :select, collection: User.roles.map{|symbol, value| [I18n.t("activerecord.attributes.user.roles.#{symbol}"), value]}
  filter :status, as: :select, collection: User.statuses.map{|symbol, value| [I18n.t("activerecord.attributes.user.statuses.#{symbol}"), value]}
  filter :created_at
  filter :last_sign_in_at

end
