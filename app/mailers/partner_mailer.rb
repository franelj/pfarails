class PartnerMailer < ApplicationMailer
  def contact_email(from_company, from_email, content)
    @from_email = from_company
    @from_company = from_email
    @content = content
    mail(to: "contact@spotnsnap.com", subject: "Nouvelle demande de partenaire")
  end

  def partner_confirmation_email(user)
    mail(to: @user.email, subject: "Votre demande de partenariat a été acceptée")
  end
end
