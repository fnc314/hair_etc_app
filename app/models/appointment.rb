class Appointment < ActiveRecord::Base
  has_many :appoffs
  has_many :offerings, through: :appoffs
  belongs_to :client
  belongs_to :stylist
end
