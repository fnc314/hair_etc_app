class Api::SessionsController < ApiController

  skip_before_filter :authenticate_client_from_token!



  def create
    client = Client.find_by(:email => params[:email])
    if client.valid_password?(params[:password])
      respond_to do |f|
        f.json {
          render :json => { first_name: client.first_name, authentication_token: client.authentication_token }
        }
      end
    end
    # puts "****************"
    # puts request.headers["X-CSRF-Token"]
    # if request.format == 'application/json'
    #   puts "=============>>>><<<<=============="
    #   puts request.original_url
    #   puts "=============>>>><<<<=============="
    # end
    # puts "****************"

    # respond_to do |f|
    #   f.json {
    #     render :json => { first_name: client.first_name, authentication_token: client.authentication_token }
    #   }
    # end
  end

end