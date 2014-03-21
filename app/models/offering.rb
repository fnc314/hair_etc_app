class Offering < ActiveRecord::Base
  has_many :appoffs
  has_many :appointments, through: :appoff
end
