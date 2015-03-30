class Api::V1::LocationsController < Api::V1::ApplicationController
  def create
    check_params_keys_presence :latitude, :longitude

    if current_user.offline?
      render_json_error 400, "Vous avez été déconnecté"
    elsif current_user.locations.last != nil && current_user.locations.last.created_at >= 15.seconds.ago
      render_json_message "Votre localisation a bien été enregistrée"
    else
      @location = Location.new(latitude: params[:latitude], longitude: params[:longitude], user: current_user)
      if @location.save
        render_json_message "Votre localisation a bien été enregistrée"
      else
        render_json_error 400, "Une erreur est survenue lors de la création de la localisation"
      end
    end
  end
end
