class Api::AppointmentsController < ApiController

  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    time = params[:apptTime]
    date = params[:apptDate]
    offering_ids = params[:offering_ids]
    stylist_id = params[:stylist_id]
    client = Client.first
    appt = client.appointments.new
    appt.appt_date_time = appt_date_time_formatter(time, date)
    appt.stylist_id = stylist_id.to_i
    appt = appt_offering_ids(offering_ids, appt)
    appt.save
    respond_to do |f|
      f.json {
        render :json => appt 
      }
    end
  end

  private

  def appt_date_time_formatter(time, date)
    apptHour = (time[0] + time[1]).to_i
    apptMin = (time[3] + time[4]).to_i
    if time.match("PM")
      apptHour += 12
    end
    appt_date = date.split("-")
    appt_date_year = appt_date[2].to_i
    appt_date_month = appt_date[0].to_i
    appt_date_day = appt_date[1].to_i
    appt_date_time = DateTime.new(appt_date_year, appt_date_month, appt_date_day, 
      apptHour, apptMin)
    return appt_date_time
  end


  # Function that takes in a string of an array of numbers (from Android) and
  # the associated ActiveRecord object, does the following:
  # 1)  Convert String array to an array of integers
  # 2)  Iterate through the array and add to the passed in AR object (appt)
  # 3)  Returns the newly altered ActiveRecord object to the create method for saving
  def appt_offering_ids(offering_ids, appt)
    appt_offering_ids = offering_ids.split(/\[|\]|,|' '/)
    appt_offering_ids.delete("")
    appt_offering_ids.each do |off_id|
      off_id = off_id.to_i
      if off_id > 0 && off_id < 11
        appt.offerings.push(Offering.find_by_id(off_id))
      end
    end
    return appt
  end

end