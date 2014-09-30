class ContactMailer < ActionMailer::Base
  # Controller and methods used to initiate email

  # Temporary Email
  default to: ENV['GMAIL_USERNAME']
  # Method to send email to us
  # Will recieve a hash of params from `website_controller#mailer`
  def contactUs_email(params)
    @body = {guest_name: params["inputName"], guest_email: params["inputEmail"], guest_message: params["inputMessage"]}
    @subject = params["inputSubject"]
    @from = params["inputEmail"]
    mail({from: @from, subject: @subject})

  end

  # Method to send 'Thank You' email to visitor
  # Will recieve a hash of params from `website_controller#mailer`
  def thankYou_email(params)

  end

end
