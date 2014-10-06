class Api::WebsiteController < ApiController

  respond_to :json
  skip_before_filter :authenticate_client_from_token!

  # Always exclude: "created_at", "updated_at", "phone" from queries for stylists
  # Always exclude: "created_at", "updated_at" from queries for offerings

  # Method to return the json object of all stylists
  # File From: angular-HairEtcPittsburgh/app/stylists/stylists.json
  def all_stylists
    @stylists = Stylist.all.to_a
    respond_to do |f|
      f.json {
        render :json => @stylists, except: ["created_at", "updated_at", "phone"]
      }
    end
  end

  def stylist
    @stylist = Stylist.find_by(first_name: params["first_name"])
    respond_to do |f|
      f.json {
        render :json => @stylist, except: ["created_at", "updated_at", "phone"]
      }
    end
  end

  # Do I need this? -> Price list hard-coded into HTML is not ideal but may be easiest
  def all_offerings
    @offerings = Offering.all.to_a
    respond_to do |f|
      f.json {
        render :json => @offerings, only: ["name", "price"]
      }
    end
  end

  # Method to respond and serve up urls for exterior_interior photos loaded to amazon
  def int_ext_photos
    @intextPhotos = {photoUrls: []}
    urlBaseString = 'https://s3.amazonaws.com/HairEtcPittsburgh/'
    S3_BUCKET.objects.with_prefix('images/exterior_interior/').each do |obj|
      if obj.content_length > 0
        @intextPhotos[:photoUrls].push(urlBaseString + obj.key)
      end
    end
    respond_to do |f|
      f.json {
        render :json => @intextPhotos
      }
    end
  end

  # Method to respond and serve up urls for exterior_interior photos loaded to amazon
  def work_sample_photos
    @workSamplePhotos = {photoUrls: []}
    urlBaseString = 'https://s3.amazonaws.com/HairEtcPittsburgh/'
    S3_BUCKET.objects.with_prefix('images/work_samples/').each do |obj|
      if obj.content_length > 0
        @workSamplePhotos[:photoUrls].push(urlBaseString + obj.key)
      end
    end
    respond_to do |f|
      f.json {
        render :json => @workSamplePhotos
      }
    end
  end

  ################################### MAILER ###################################
  # Set up ActionMailer using this method and the supplied `request`
  
  # This method needs to do 3 things:
  #   1) Send email to Hair Etc
  #   2) Send "Thank You" email to visitor <- Not implemented yet!
  #   3) Return JSON with success messages back to Angular site
  # There needs to be verification logic to ensure that emails are infact sent 
  # (at least to Hair Etc) before responding to Angular
  # -> Response to client is decent

  def mailer
    # call ActionMailer and pass to it entire params hash
    # p is params hash from request
    # d is date data (hash) created personally by Angular controller responsible for `Contact Us` page
    p = params.require(:form).permit(:inputEmail, :inputMessage, :inputSubject, :inputName)
    d = params.require(:date).permit(:day, :date, :month, :year, :hour, :minute) # date of request

    if ApiController.api_mailer(p,d) # this sends email to Hair Etc
      respond_to do |f|
        @response = {success: true, message: "Thanks for the feedback!"}
        f.json {
          render :json => @response
        }
      end
    else
      respond_to do |f|
        @response = {success: false, message: "Sorry.  There was an issue.  Call instead? "}
        f.json {
          render :json => @response
        }
      end
    end


    # ContactMailer.ThankYou_email(params).deliver # this sends email to guest
  end
  ################################### MAILER ###################################

end
