class AppointmentsController < ApplicationController
  
  include AppointmentsHelper
  
  before_filter :authenticate_client!

  def index
    @appointment = current_client.appointments.includes(:stylist).includes(:offerings).order("created_at DESC")
    @appointments = @appointment.to_a
    respond_to do |f|
      f.html
      f.json { render :json => @appointment }
      f.xml { render :xml => @appointment }
    end
  end

  def new
    @appointment = current_client.appointments.includes(:stylist).includes(:offerings).new
    @appointment.stylist_id = 1
  end

  def create
    new_appt = params.require(:appointment).permit(:stylist_id, :offering_ids => [])
    # Fixed issue with permit
    new_appt_datetime = params.require(:date).permit(:year, :month, :day, :hour, :minute)
    # extract new form for datetime from params <- stronger form than before
    # Create appt_date_time value as a_d_t
    a_d_t = DateTime.new(new_appt_datetime["year"].to_i,new_appt_datetime["month"].to_i,
      new_appt_datetime["day"].to_i,new_appt_datetime["hour"].to_i, new_appt_datetime["minute"].to_i)
    # Make new appt
    appt = current_client.appointments.create(:appt_date_time => a_d_t)
    # extraneous empty string proveded by collection_check_boxes
    new_appt["offering_ids"].delete("")
    appt.offering_ids = new_appt["offering_ids"].map do |o|
      o.to_i
    end
    # Attached desired stylist
    appt.stylist_id = new_appt["stylist_id"].to_i
    # Save appt
    appt.save
    # Trigger text message tos tylist about requested appointment
    text_stylist_create(current_client, appt)
    respond_to do |f|
      f.html { redirect_to client_appointments_path(current_client.id) }
    end
  end

  def show
    @appointment = current_client.appointments.includes(:stylist).includes(:offerings).find(params[:id])
    respond_to do |f|
      f.html
    end
  end

  def edit
    @appointment = current_client.appointments.includes(:stylist).includes(:offerings).find(params[:id])
  end

  def update
    appt = current_client.appointments.find(params[:id])
    # Trigger text message to stylist about requested changes
    # Trigger is done before edits so that the current appt.appt_date_time can
    # be sent to the stylist wihtout wasting memory and storing the old date
    # and sending it separately.  The appt_date_time value is what the stylist
    # will use to determine exactly which appointment is being edited
    text_stylist_edit(current_client, appt)
    # Mimic format of create function
    # Fixed issue with permit
    edited_appt = params.require(:appointment).permit(:stylist_id, :offering_ids => [])
    # extract new form for datetime from params <- stronger form
    edited_appt_datetime = params.require(:date).permit(:year, :month, :day, :hour, :minute)
    # Create appt_date_time value as new_a_d_t
    new_a_d_t = DateTime.new(edited_appt_datetime["year"].to_i,edited_appt_datetime["month"].to_i,
      edited_appt_datetime["day"].to_i,edited_appt_datetime["hour"].to_i, edited_appt_datetime["minute"].to_i)
    appt.appt_date_time = new_a_d_t
    appt.stylist_id = edited_appt["stylist_id"].to_i
    # extraneous empty string proveded by collection_check_boxes
    edited_appt["offering_ids"].delete("")
    appt.offering_ids = edited_appt["offering_ids"].map do |o|
      o.to_i
    end
    # Save appt
    appt.save
    respond_to do |f|
      f.html { redirect_to client_appointments_path(current_client.id) }
    end
  end

  def destroy
    appt = current_client.appointments.find(params[:id])
    # Trigger text message to stylist about requested cancellation
    text_stylist_delete(current_client, appt)
    appt.destroy
    respond_to do |f|
      f.html { redirect_to client_appointments_path(current_client.id) }
    end
  end

end
