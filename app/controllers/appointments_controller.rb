class AppointmentsController < ApplicationController
  before_filter :authenticate_client!

  def index
    @appointments = current_client.appointments.all.includes(:services)
  end

  def new
    @appointment = current_client.appoinments.new
  end

  def create
    new_appointment = current_client.appointments.new
    
  end

  def show
  end

  def update
  end

  def destroy
  end
end
