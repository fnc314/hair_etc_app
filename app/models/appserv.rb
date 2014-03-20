class Appserv < ActiveRecord::Base
  belongs_to :appointments
  belongs_to :services
end
