class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  acts_as_token_authentication_handler_for Client

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :authenticate_client_from_token!
  before_filter :authenticate_client!


  protected

  def authenticate_client_from_token!

  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation) }
  end
end
