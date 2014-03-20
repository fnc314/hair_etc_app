class Appointment < ActiveRecord::Base
  has_many :appservs
  has_many :services, through: :appserv
  belongs_to :client
  belongs_to :stylist
end
