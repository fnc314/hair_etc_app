class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  # before_filter :authenticate_client_from_token!
  # before_filter :authenticate_client!


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

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation) }
  end
end
