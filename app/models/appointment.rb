class Appointment < ActiveRecord::Base
  has_many :appservs
  has_many :services, through: :appservs
  belongs_to :client
  belongs_to :stylist
end
