class Api::WebsiteController < ApiController

  respond_to :json
  skip_before_filter :authenticate_client_from_token!
  before_filter :angular_site_headers

  # Always exclude: "created_at", "updated_at", "phone" from queries for stylists
  # Always exclude: "created_at", "updated_at" from queries for offerings

  # Method to return the json object of all stylists
  # File From: angular-HairEtcPittsburgh/app/stylists/stylists.json
  def all_stylists
    @stylists = Stylist.all.to_a
    respond_to do |f|
      f.json {
        render :json => @stylists, except: ["created_at", "updated_at", "bio_full", "phone", "photos"]
      }
    end
  end

  def stylist
    @stylist = Stylist.find_by(first_name: params["first_name"])
    respond_to do |f|
      f.json {
        render :json => @stylist, except: ["created_at", "updated_at", "bio_short", "phone"]
      }
    end
  end

  def all_offerings
    @offerings = Offering.all.to_a
    respond_to do |f|
      f.json {
        render :json => @offerings, only: ["name", "price"]
      }
    end
  end

  # Set up ActionMailer using this method and the supplied `request`
  def mailer
    respond_to do |f|
      f.json {
        puts request
      }
    end
  end

end
