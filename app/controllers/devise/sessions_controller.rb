class SessionsController < Devise::SessionsController

  skip_before_filter :authenticate_user!, :only => [:create]
  skip_authorization_check only: [:create]
  respond_to :json

  def create

    respond_to do |f|
      f.html {
        super
      }
      f.json {
        # resource = resource_from_credentials

        # return invalid_login_attempt unless resource

        # if resource.valid_password?(params[:password])
          puts "Hello World"
        # else
        #   puts "goodbye"
        # end
      }
    end

  end

end