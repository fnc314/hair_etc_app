class ApiController < ApplicationController

  protect_from_forgery with: :null_session

  skip_before_filter :authenticate_client!
  before_filter :authenticate_client_from_token!
  before_filter :csrf_token
  respond_to :json


  # p is params
  # d is date of request
  def self.api_mailer(p,d)
    ContactMailer.contactUs_email(p,d).deliver
    # Immediately after email is sent to Hair Etc... send a thank you email to client
    ContactMailer.thankYou_email(p,d).deliver
  end

  protected

  def authenticate_client_from_token!
    client_email = request.headers["X-CLIENT-EMAIL"].presence
    client_auth_token = request.headers["X-CLIENT-TOKEN"].presence
    client = client_email && Client.find_by_email(client_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if client && Devise.secure_compare(client.authentication_token, client_auth_token)
      sign_in(client, store: false)
    end
  end

  def csrf_token
    request.headers["X-CSRF-Token"] = form_authenticity_token
  end

  

end

# Work here comes from https://github.com/jamesotron/Blogomat/blob/master/app/controllers/api_controller.rb
