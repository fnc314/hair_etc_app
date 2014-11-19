class Appointment < ActiveRecord::Base
  has_many :appoffs
  has_many :offerings, through: :appoffs
  belongs_to :client
  belongs_to :stylist

  # TODO: Remove code from controllers/appointments_controller.rb for linting/parsing
  # params (Hash) of `DateTime` object from Create/Update methods
  # CAN MAKE CLASS OR INSTANCE METHOD (INSTANCE METHOD REQUIRES USE OF `self.`)

  # Instance Methods used in db/seeds.rb on an INSTANCE of `Appointment` Class

  # Is called to assign 'random' a `appt_date_time` value to a given appointment
  def seed_date_maker()
    year = (DateTime.now.year-2..DateTime.now.year+2).to_a.sample
    hour = (9..20).to_a.sample
    minute = [00, 30].sample
    month = (1..12).to_a.sample
    if month == 2
      day = (1..28).to_a.sample
    elsif [1,3,5,7,8,10,12].include?(month)
      day = (1..31).to_a.sample
    else
      day = (1..30).to_a.sample
    end
    self.appt_date_time = DateTime.new(year, month, day, hour, minute)
  end

  # Is called to assign 'random' `offerings` to a given appointment
  def seed_offering_assignment()
    off1, off2, off3 = Offering.all.sample, Offering.all.sample, Offering.all.sample
    if off1 != off2 && off1 != off3 && off3 != off2
      self.offerings = [off1, off2, off3]
    elsif off1 != off2 && off2 != off3
      self.offerings = [off1, off2]
    else
      new_off_id = ( (off1.id + off2.id + off3.id) / 3.0).round
      self.offerings = [Offering.find(new_off_id)]
    end
  end

  # Is called to assign 'random' `stylist_id` and `client_id` to a given appointment
  def seed_client_stylist()
    self.client_id = Client.all.sample.id
    self.stylist_id = Stylist.all.sample.id
  end

  # Is called to assign 'random' seed data to a given appointment
  def seed_data()
    self.seed_client_stylist
    self.seed_offering_assignment
    self.seed_date_maker
  end

end
