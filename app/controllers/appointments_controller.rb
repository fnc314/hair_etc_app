class AppointmentsController < ApplicationController
  
  before_filter :authenticate_client!

  def index
    @appointments = current_client.appointments.all
  end

  def new
    @appointment = current_client.appointments.new
  end

  def create
    new_appt_serv = params.require(:appointment)[:services]
    new_appt = params.require(:appointment).permit(:appt_date_time)
    appt = current_client.appointments.create
    a_d_t = DateTime.new(new_appt["appt_date_time(1i)"].to_i,new_appt["appt_date_time(2i)"].to_i,
      new_appt["appt_date_time(3i)"].to_i,new_appt["appt_date_time(4i)"].to_i, new_appt["appt_date_time(5i)"].to_i)
    appt.appt_date_time = a_d_t
    new_appt_serv.each do |s|
      appt.services << Service.find(s.to_i) if s != ""
    end
    appt.stylist_id = params[:stylist].to_i
    appt.save
    respond_to do |f|
      f.html { client_appointments_path(current_client.id) }
    end

  end

  def show
    @appointment = current_client.appointments.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
