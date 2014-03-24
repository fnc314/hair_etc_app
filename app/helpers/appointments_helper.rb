module AppointmentsHelper

  def text_stylist_create(current_client, appt)

    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

    a_d_t = appt.appt_date_time.strftime("%a. %b. %d %Y at%l:%M %p")

    @client.account.sms.messages.create(
      :from => ENV['TWILIO_PHONE'],
      :to => appt.stylist.phone,
      :body => "#{current_client.first_name} #{current_client.last_name} wants to schedule an appointment on #{a_d_t} for #{offerings(appt)}.  Please call #{current_client.phone}.")

  end

  def text_stylist_edit(current_client, appt)

    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

    a_d_t = appt.appt_date_time.strftime("%a. %b. %d %Y at%l:%M %p")

    @client.account.sms.messages.create(
      :from => ENV['TWILIO_PHONE'],
      :to => appt.stylist.phone,
      :body => "#{current_client.first_name} #{current_client.last_name} would like to change their appointment on #{a_d_t}.  Please call #{current_client.phone}.")

  end

  def text_stylist_delete(current_client, appt)

    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

    a_d_t = appt.appt_date_time.strftime("%a. %b. %d %Y at%l:%M %p")

    @client.account.sms.messages.create(
      :from => ENV['TWILIO_PHONE'],
      :to => appt.stylist.phone,
      :body => "#{current_client.first_name} #{current_client.last_name} cancelled their appointment on #{a_d_t}.  Please call #{current_client.phone}.")

  end

  def offerings(appt)
    offerings = ""
    appt.offering_ids.each do |i|
      offerings += Offering.find(i).name + " "
    end
    return offerings
  end

end
