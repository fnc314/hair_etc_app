module AppointmentsHelper

  def text_stylist_create(current_client, appt)

  # account_sid = ENV['TWILIO_SID']
  # auth_token = ENV['TWILIO_TOKEN']
  @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']


  @client.account.sms.messages.create(
    :from => ENV['TWILIO_PHONE'],
    :to => appt.stylist.phone,
    :body => "#{current_client.first_name} #{current_client.last_name} wants to 
      schedule an appointment on #{appt.appt_date_time} for #{appt.offering_ids}.  
      Phone: #{current_client.phone}.")

  end

end
