class ContactMailer < ActionMailer::Base
  # Controller and methods used to initiate email

  # Temporary Email
  default to: "HairEtcPittsburgh@gmail.com"
  # Method to send email to us
  # Will recieve a hash of params from `website_controller#mailer`
  def contactUs_email(params)
    @message = params["inputMessage"]
    mail(subject: params["inputSubject"], from: params["inputEmail"])

  end

  # Method to send 'Thank You' email to visitor
  # Will recieve a hash of params from `website_controller#mailer`
  def thankYou_email(params)

  end

end
