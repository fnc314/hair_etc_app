class ApiController < ApplicationController

  # protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  skip_before_filter :verify_authenticy_token
  respond_to :json

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

end

# Work here comes from https://github.com/jamesotron/Blogomat/blob/master/app/controllers/api_controller.rb