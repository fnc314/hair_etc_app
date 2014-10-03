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

Stylist.create(first_name: "Theresa", last_name: "Colaizzi", years: 25, title: "Owner/Stylist", specialties: ["Corrective Color", "Men's Styles"], schedule: ["Wednesday", "Thursday", "Saturday"], tag_line: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc finibus enim nisl, dictum semper arcu ornare viverra. Integer sit amet dui rutrum, ornare risus ut, maximus orci.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Theresa.jpg")
Stylist.create(first_name: "Stacy (Carolyn)", last_name: "Funwella", years: 43, specialties: ["Perms"], schedule: ["Monday", "Thursday", "Friday", "Saturday"], tag_line: "Let me make your locks curly.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Stacy.jpg")
Stylist.create(first_name: "Krista", last_name: "Vrana", years: 8, specialties: ["Fantasy Color"], schedule: ["Monday", "Friday", "Saturday"], tag_line: "I will fulfill your hair fantasy.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Krista.jpg")
Stylist.create(first_name: "Juneau", last_name: "Bowman", years: 32, specialties: ["Color"], schedule: ["Tuesday", "Wednesday", "Saturday"], tag_line: "I wanted to make the world beautiful so I became a stylist.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Juneau.jpg")
Stylist.create(first_name: "Chrissy", last_name: "Darnley-West", years: 25, specialties: ["HiLites", "UpDo", "Make-Up Artistry"], schedule: ["Tuesday", "Wednesday", "Thursday", "Saturday"], tag_line: "Help me help you find your inner beauty!", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Chrissy.jpg")
Stylist.create(first_name: "Sheri", last_name: "Humbert", years: 23, specialties: ["Long-Hair Services", "Formal Styling"], schedule: ["Friday", "Saturday"], tag_line: "Let me inspire you.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Sheri.jpg")

Offering.all.each do |s|
  s.destroy
end

Offering.create(name: "Cut/Style", price: 20.00)
Offering.create(name: "Color", price: 50.00)
Offering.create(name: "Partial Color", price: 35.00)
Offering.create(name: "Hilights", price: 50.00)
Offering.create(name: "Partial Hilights", price: 35.00)
Offering.create(name: "Wax", price: 10.00)
Offering.create(name: "Updo", price: 60.00)
Offering.create(name: "Perm", price: 50.00)
Offering.create(name: "Brazilian Blowout", price: 80.00)
Offering.create(name: "Extensions", price: 30.00)


Client.all.each do |c|
  c.destroy
end

Client.create(first_name: "John", last_name: "Smith", email: "abc@def.com", password: "1234567890", password_confirmation: "1234567890", phone: "0000000000")
Client.create(first_name: "Rebecca", last_name: "Jones", email: "example@example.com", password: "1234567890", password_confirmation: "1234567890", phone: "0000000000")
Client.create(first_name: "Frodo", last_name: "Baggins", email: "example@sample.com", password: "1234567890", password_confirmation: "1234567890", phone: "0000000000")

Appointment.all.each do |a|
  a.destroy
end

(1..50).each do

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
  stylist_id = (1..Stylist.count).to_a.sample
  client_id = [1,2].sample
  a = Appointment.new(appt_date_time: date, client_id: client_id, stylist_id: stylist_id)
  off = (1..Offering.count).to_a
  off1 = off.sample
  off2 = off.sample
  off3 = off.sample
  if off1 != off2 && off1 != off3 && off3 != off2
    a.offerings.push(Offering.find(off1))
    a.offerings.push(Offering.find(off2))
    a.offerings.push(Offering.find(off3))
  elsif off1 != off2 && off2 != off3
    a.offerings.push(Offering.find(off1))
    a.offerings.push(Offering.find(off2))
  else
    offering = ((off1+off2+off3)/3.0).round
    a.offerings.push(Offering.find(offering))
  end
  a.save

end
