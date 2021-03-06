module AppointmentsHelper

  def text_stylist_create(current_client, appt)

    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

    a_d_t = appt.appt_date_time.strftime("%a. %b. %d, %Y at%l:%M %p")

    message = "#{current_client.first_name} #{current_client.last_name} wants to schedule an appointment on #{a_d_t} for #{offerings(appt)}.  Please call #{current_client.phone}."

    if message_length_check(message)
      message = "Please call #{current_client.first_name} #{current_client.last_name} at #{current_client.phone} for an appointment on #{a_d_t}."
    end

    @client.account.sms.messages.create(
      :from => ENV['TWILIO_PHONE'],
      :to => appt.stylist.phone,
      :body => message)

  end

  def text_stylist_edit(current_client, appt)

    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

    a_d_t = appt.appt_date_time.strftime("%a. %b. %d, %Y at%l:%M %p")

    @client.account.sms.messages.create(
      :from => ENV['TWILIO_PHONE'],
      :to => appt.stylist.phone,
      :body => "#{current_client.first_name} #{current_client.last_name} would like to change their appointment on #{a_d_t}.  Please call #{current_client.phone}.")

  end

  def text_stylist_delete(current_client, appt)

    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

    a_d_t = appt.appt_date_time.strftime("%a. %b. %d, %Y at%l:%M %p")

    @client.account.sms.messages.create(
      :from => ENV['TWILIO_PHONE'],
      :to => appt.stylist.phone,
      :body => "#{current_client.first_name} #{current_client.last_name} cancelled their appointment on #{a_d_t}.  Please call #{current_client.phone}.")

  end

  private
  # Method used to extract all of an appointments attached Offerings and display
  # the string of names in text message to stylist.
  def offerings(appt)
    offerings = ""
    if appt.offerings == []
      offerings = "No Services Selected"
    else
      appt.offerings.each do |off|
        offerings += off.name + " "
      end
    end
    return offerings
  end

  def message_length_check(message)
    if message.length > 160
      true
    else
      false
    end
  end

end
