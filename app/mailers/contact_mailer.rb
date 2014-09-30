class ContactMailer < ActionMailer::Base
  # Controller and methods used to initiate email

  # Temporary Email
  default to: ENV['GMAIL_USERNAME']
  # Method to send email to us
  # Will recieve a hash of params and date from `website_controller#mailer`
  # p - params hash from Rails request with customer data
  # d - date hash made by hand in Angular controller responsible for `Contact Us` form
  def contactUs_email(p,d)
    @body = {guest_name: p["inputName"], guest_email: p["inputEmail"], guest_message: p["inputMessage"], request_date: d}
    @subject = p["inputSubject"]
    @from = p["inputEmail"]
    mail({from: @from, subject: @subject})

  end

  # Method to send 'Thank You' email to visitor
  # Will recieve a hash of params from `website_controller#mailer`
  def thankYou_email(params)

  end

end
