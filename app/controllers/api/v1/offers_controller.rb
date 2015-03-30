class Api::V1::OffersController < Api::V1::ApplicationController

  def show
    check_params_keys_presence :offer_id

    render json: PartnerOffer.find(params[:offer_id])
  end
end
