class Service < ActiveRecord::Base
  has_many :appservs
  has_many :appointments, through: :appserv
end
