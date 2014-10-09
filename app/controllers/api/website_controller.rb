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

  # Method to respond and serve up urls for work_samples photos loaded to amazon
  def work_sample_photos
    @workSamplePhotos = {photoUrls: []}
    @workSamplePhotos[:photoUrls] = amazonQuery('images/work_samples/') # private method => Returns array
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

    if ApiController.api_mailer(p,d) # this sends email to Hair Etc and customer
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

  private

  # Method that actually calls amazon and returns desired result
  # Returns array of strings `urls` of each objects public url
  def amazonQuery(base_str)
    urls = S3_BUCKET.objects.with_prefix(base_str).collect(&:public_url).drop(1) # remove first entry; equals `base_str`
    urls.map! { |obj| obj.to_s } # Turn URI objects to String objects
    return urls
  end

end
