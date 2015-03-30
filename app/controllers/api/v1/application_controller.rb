class Api::V1::ApplicationController < ApplicationController
  before_action :check_api_token
  before_action :authenticate!
  before_action :check_user_photo!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error
  rescue_from ActionController::RoutingError, with: :not_found_error
  rescue_from Api::V1::BadArgumentsException,  with: :bad_arguments_error
  rescue_from Api::V1::AuthenticationException, with: :authentication_error
  #rescue_from Exception, with: :not_found_error

  protected

  def check_params_keys_presence(*keys)
    missing_keys = []
    keys.each do |key| missing_keys.push key.to_s unless params.has_key? key end
    raise Api::V1::BadArgumentsException.new(*missing_keys) unless missing_keys.empty?
  end

  def render_json_error(status, message)
    render json: {message: message}, status: status
  end

  def render_json_message(message)
    render json: { message: message }
  end

  private

  def authenticate!
    check_params_keys_presence :email, :token
    user_email = params[:email].presence
    user       = user_email && User.find_by_email(user_email)

    if user && Devise.secure_compare(user.authentication_token, params[:token])
      sign_in user, store: false
    else
      raise Api::V1::AuthenticationException.new("Votre email et/ou votre token sont invalides")
    end
  end

  def check_user_photo!
    raise Api::V1::AuthenticationException.new("Vous devez avoir une photo pour jouer !") if current_user.photo.blank?
  end

  def check_api_token
    check_params_keys_presence :api_key
    raise Api::V1::AuthenticationException.new("Votre clé API est invalide") if (params[:api_key] != Rails.application.secrets.api_key)
  end

  def not_found_error(exception)
    render json: { message: exception.message }, status: 404
  end

  def bad_arguments_error(exception)
    render json: { message: exception.message }, status: 400
  end

  def authentication_error(exception)
    render json: { message: exception.message }, status: 401
  end

  def handle_unverified_request
  end
end
