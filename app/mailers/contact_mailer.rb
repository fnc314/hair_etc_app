class ContactMailer < ActionMailer::Base
  # Controller and methods used to initiate email

  # Method to send email to us
  # Will recieve a hash of params and date from `website_controller#mailer`
  # p - params hash from Rails request with customer data
  # d - date hash made by hand in Angular controller responsible for `Contact Us` form
  def contactUs_email(p,d)
    @body = body_sanitize(p)
    @body[:request_date] = timestamp_sanitize(d)
    # Subject of the email (provided by client)
    @subject = p["inputSubject"]
    # Email account for replies (provided by client)
    @from = p["inputEmail"]
    # Call this function to send mail => feed a hash of options
    mail({from: @from, subject: @subject, to: ENV['GMAIL_USERNAME']})
  end

  # Method to send 'Thank You' email to visitor
  # Will be called from `contactUs_email` above
  # Call after `mail({})` and call with @body
  def thankYou_email(p,d)
    # Copy the input and set it as an instance variable (identical name to allow for copy and paste of html code)
    @body = body_sanitize(p)
    @body[:request_date] = timestamp_sanitize(d)
    # Call this function to send mail => destination provided by `@body` input/instance variable
    mail({from: ENV['GMAIL_USERNAME'], subject: "Thank you for reaching out to us!", to: @body[:guest_email]})
  end

  private

  def timestamp_sanitize(d)
    # Create DateTime object and use `strftime` like in other sections
    timestamp = DateTime.new(d[:year].to_i, d[:month].to_i, d[:date].to_i, d[:hour].to_i, d[:minute].to_i).strftime("%a. %b. %d, %Y at %l:%M %p")
    return timestamp
  end

  def body_sanitize(p)
    # Body oject (instance variable when called above) to populate email `<body>` tag
    body = {
      guest_name: p["inputName"],
      guest_email: p["inputEmail"],
      guest_message: p["inputMessage"]
    }
    return body
  end

end
