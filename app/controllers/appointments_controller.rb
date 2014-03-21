class AppointmentsController < ApplicationController
  
  before_filter :authenticate_client!

  def index
    @appointments = current_client.appointments.includes(:stylist).order("created_at DESC").to_a
  end

  def new
    @appointment = current_client.appointments.new
  end

  def create
    new_appt = params.require(:appointment).permit(:appt_date_time, :services, :stylist)
    # Create appt_date_time value as a_d_t
    a_d_t = DateTime.new(new_appt["appt_date_time(1i)"].to_i,new_appt["appt_date_time(2i)"].to_i,
      new_appt["appt_date_time(3i)"].to_i,new_appt["appt_date_time(4i)"].to_i, new_appt["appt_date_time(5i)"].to_i)
    appt = current_client.appointments.create(:appt_date_time => a_d_t)
    new_appt["services"].each do |s|
      appt.services.push(Offering.find(s.to_i)) if s != ""
    end
    appt.stylist_id = new_appt["stylist"].to_i
    appt.save
    respond_to do |f|
      f.html { redirect_to client_appointments_path(current_client.id) }
      f.json { render :json => current_client.appointments }
    end

  end

  def show
    @appointment = current_client.appointments.find(params[:id])
  end

  def edit
    @appointment = current_client.appointments.find(params[:id])
  end

  def update
    appt = current_client.appointments.find(params[:id])
    # Mimic format of create function
    edited_appt_serv = params.require(:appointment).permit(:services)
    edited_appt_stylist = params.require(:appointment).permit(:stylist)
    edited_appt = params.require(:appointment).permit(:appt_date_time)
    # Create appt_date_time value as new_a_d_t
    new_a_d_t = DateTime.new(edited_appt["appt_date_time(1i)"].to_i,edited_appt["appt_date_time(2i)"].to_i,
      edited_appt["appt_date_time(3i)"].to_i,edited_appt["appt_date_time(4i)"].to_i, edited_appt["appt_date_time(5i)"].to_i)
    appt.appt_date_time = new_a_d_t
    appt.stylist_id = edited_appt_stylist["stylist"].to_i
    edited_appt_serv.each do |s|
      appt.services.push(Offering.find(s.to_i)) if s != ""
    end
    # Save appt
    appt.save
    respond_to do |f|
      f.html { redirect_to client_appointments_path(current_client.id) }
      f.json { render :json => current_client.appointments }
    end

  end

  def destroy
  end

end
