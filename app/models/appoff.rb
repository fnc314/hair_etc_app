class Appoff < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :offering
end
