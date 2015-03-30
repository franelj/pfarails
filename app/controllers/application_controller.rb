class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << :username
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
  end

  def after_sign_in_path_for(resource)
    partner_offers_path
  end

  def authenticate_admin_user!
    redirect_to new_user_session_path unless current_user.try(:admin?)
  end

  def current_admin_user
    if current_user.try(:admin?)
      current_user
    else
      nil
    end
  end
end
