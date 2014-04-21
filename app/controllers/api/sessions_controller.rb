class Api::SessionsController < ApiController

  skip_before_filter :authenticate_client_from_token!
  


  def create
    client_email = params["email"]
    client = Client.find_by(:email => client_email)
    puts "****************"
    puts request.format.class
    puts request.headers["X-CSRF-Token"]
    if request.format == 'application/json'
      puts "=============>>>><<<<=============="
      puts request.original_url
      puts "=============>>>><<<<=============="
    end
    puts "****************"

    respond_to do |f|
      f.json {
        render :json => {succuss: true, client: {
          token: client.authentication_token
          }}
      }
    end
  end

end