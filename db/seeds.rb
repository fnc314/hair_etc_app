# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Stylist.all.each do |s|
  s.destroy
end

Stylist.create(first_name: "Theresa", last_name: "Colaizzi")
Stylist.create(first_name: "Chrissy", last_name: "West")
Stylist.create(first_name: "Stacy", last_name: "Funwella")
Stylist.create(first_name: "Juneau", last_name: "Bowman")
Stylist.create(first_name: "Sheri", last_name: "Humbert")

Offering.all.each do |s|
  s.destroy
end

Offering.create(name: "Cut/Style")
Offering.create(name: "Color")
Offering.create(name: "Hilights")
Offering.create(name: "Wax")
Offering.create(name: "Updo")
Offering.create(name: "Perm")
Offering.create(name: "Brazilian Blowout")

Client.all.each do |c|
  c.destroy
end

Client.create(first_name: "John", last_name: "Smith", email: "abc@def.com", password: "1234567890", password_confirmation: "1234567890", phone: "0000000000")

Appointment.all.each do |a|
  a.destroy
end

(1..15).each do

  month = (1..12).to_a.sample
  if month == 2
    day = (1..28).to_a.sample
  elsif [1,3,5,7,8,10,12].include?(month)
    day = (1..31).to_a.sample
  else
    day = (1..30).to_a.sample
  end
  hour = (9..20).to_a.sample
  minute = [00, 30].sample
  date = DateTime.new(2014, month, day, hour, minute)
  stylist_id = (1..5).to_a.sample
  a = Appointment.new(appt_date_time: date, client_id: 1, stylist_id: stylist_id)
  off = (1..7).to_a
  off1 = off.sample
  off2 = off.sample
  if off1 != off2
    a.offering_ids = [off1, off2]
  else
    a.offering_ids = [off1]
  end
  a.save

end
