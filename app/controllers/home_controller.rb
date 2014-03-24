class HomeController < ApplicationController

  def index
    if signed_in?
      
      if current_client.appointments.count != 0
        @appointment = current_client.appointments.order("updated_at DESC").first
        respond_to do |f|
          f.html
          f.json
        end
      else
        respond_to do |f|
          f.html
          f.json
        end
      end
      
    else
      respond_to do |f|
        f.html
        f.json
      end
    end
  end

end