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

Service.all.each do |s|
  s.destroy
end

Service.create(name: "Cut/Style")
Service.create(name: "Color")
Service.create(name: "Hilights")
Service.create(name: "Wax")
Service.create(name: "Updo")
Service.create(name: "Perm")
Service.create(name: "Brazilian Blowout")

Client.all.each do |c|
  c.destroy
end

Client.create(first_name: "John", last_name: "Smith", email: "abc@def.com", password: "1234567890", password_confirmation: "1234567890", phone: "0000000000")