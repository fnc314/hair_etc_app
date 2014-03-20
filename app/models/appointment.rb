class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :stylist
  has_many :appservs
  has_many :services, through: :appserv
end
