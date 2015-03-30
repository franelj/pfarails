class PartnerOffersController < ApplicationController
  layout "partners"
  before_action :authenticate_partner_user!, except: [:presentation, :contact]

  def index
    @offers = current_user.partner_offers
  end

  def show
    @offer = PartnerOffer.find(params[:id])
  end

  def new
    @offer = PartnerOffer.new
  end

  def create
    @offer = PartnerOffer.new(partner_offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to partner_offers_path, notice: "Votre offre a bien été créée"
    else
      render 'new'
    end
  end

  def destroy
    @offer = PartnerOffer.find(params[:id])
    @offer.destroy
    redirect_to partner_offers_path, notice: "Votre offre a bien été supprimée"
  end

  def edit
    @offer = PartnerOffer.find(params[:id])
  end

  def update
    @offer = PartnerOffer.find(params[:id])
    if @offer.update_attributes(partner_offer_params)
      redirect_to partner_offers_path, notice: "Votre offre a bien été mise à jour"
    else
      render 'edit'
    end
  end

  def presentation
  end

  def contact
    @errors = []
    @errors.push "Vous devez spécifier un email" if params[:from_email].blank?
    @errors.push "Vous devez spécifier une compagnie" if params[:from_company].blank?
    @errors.push "Vous devez renseigner une description" if params[:content].blank?
    PartnerMailer.contact_email(params[:from_company], params[:from_email], params[:content]).deliver if @errors.empty?
    render 'presentation'
  end

  private

  def authenticate_partner_user!
    redirect_to new_user_session_path unless (current_user.try(:partner?) || current_user.try(:admin?))
  end

  def partner_offer_params
    params.require(:partner_offer).permit(:latitude, :longitude, :content)
  end
end
