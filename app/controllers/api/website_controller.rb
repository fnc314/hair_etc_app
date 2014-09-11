class Api::WebsiteController < ApiController

  respond_to :json
  skip_before_filter :authenticate_client_from_token!
  before_filter :angular_site_headers


  # Method to return the json object of all stylists
  # File From: angular-HairEtcPittsburgh/app/stylists/stylists.json
  def all_stylists
    respond_to do |f|
      f.json {
        render :json => Stylist.all.to_a
      }
    end
  end

  def stylist
    @stylist = Stylist.find_by(first_name: params["first_name"])
    respond_to do |f|
      f.json {
        render :json => @stylist
      }
    end
  end

end