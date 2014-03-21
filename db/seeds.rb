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

Stylist.create(first_name: "Theresa", last_name: "Colaizzi", phone: "4127219550")
Stylist.create(first_name: "Chrissy", last_name: "West", phone: "4127219550")
Stylist.create(first_name: "Stacy", last_name: "Funwella", phone: "4127219550")
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

date = DateTime.new(2014, 01, 07, 12, 00)
a = Appointment.create(appt_date_time: date)
a.client_id = 1
a.stylist_id = 1
a.offerings << Offering.find(3)
a.offerings << Offering.find(4)
a.save