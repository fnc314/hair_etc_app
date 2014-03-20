class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :stylist
  has_many :services
end
