# class SessionsController < Devise::SessionsController

#   skip_before_filter :authenticate_user!, :only => [:create]
#   skip_authorization_check only: [:create]
#   respond_to :json

#   def create

#     respond_to do |f|
#       f.html {
#         super
#       }
#       f.json {
#         puts params
#         resource = resource_from_credentials

#         return invalid_login_attempt unless resource

#         if resource.valid_password?(params[:password])
#           render :json => { client: { email: resource.email, :authenticity_token: resource.authenticity_token } }, success: true, status: :created
#         else
#           invalid_login_attempt
#         end
#       }
#     end

#   end

#   protected

#   def invalid_login_attempt
#     warden.custom_failure!
#     render json: { success: false, message: 'Error with your login or password' }, status: 401
#   end

#   def resource_from_credentials
#     data = { email: params[:email] }
#       if res = resource_class.find_for_database_authentication(data)
#         if res.valid_password?(params[:password])
#           res
#         end
#       end
#   end

# end