class Service < ActiveRecord::Base
  has_many :appointments, through: :appserv
  has_many :appservs
end
