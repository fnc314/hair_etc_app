# To preserve prestine ID values in ActiveRecord, one must run the following:
# ```bash
# $ rake db:drop
# $ rake db:create
# $ rake db:migrate
# $ rake db:seed
# ```

# TODO: Custom `rake` task to drop, create, migrate, and seed DB
# SEE lib/tasks/database.rake :database_reseter

def create_stylists()
    puts "Creating Stylists"
    Stylist.create(first_name: "Theresa", last_name: "Colaizzi", years: 25, title: "Owner/Stylist", specialties: ["Corrective Color", "Men's Styles"], schedule: ["Wednesday", "Thursday", "Saturday"], tag_line: "I enjoy bringing out the beauty in others.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Theresa.png")
    Stylist.create(first_name: "Stacy (Carolyn)", last_name: "Funwella", years: 43, specialties: ["Perms"], schedule: ["Monday", "Thursday", "Friday", "Saturday"], tag_line: "Let me make your locks curly.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Stacy.png")
    Stylist.create(first_name: "Chrissy", last_name: "Darnley-West", years: 25, specialties: ["HiLites", "UpDo", "Make-Up Artistry"], schedule: ["Tuesday", "Wednesday", "Thursday", "Saturday"], tag_line: "Help me help you find your inner beauty.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Chrissy.png")
    Stylist.create(first_name: "Juneau", last_name: "Bowman", years: 32, specialties: ["Color"], schedule: ["Tuesday", "Wednesday", "Saturday"], tag_line: "As a stylist, I make the world beautiful.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Juneau.png")
    Stylist.create(first_name: "Krista", last_name: "Vrana", years: 8, specialties: ["Fantasy Color"], schedule: ["Saturday"], tag_line: "I will make your hair dream come true.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Krista.png")
    Stylist.create(first_name: "Susan", last_name: "Sachs", years: 20, specialties: ["Perms", "Men's Styles"], schedule: ["Monday", "Thursday", "Friday"], tag_line: "Lorem Ipsum Dorom.", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/Susan.png")
    Stylist.create(first_name: "Tina", last_name: "Aubrey", years: 25, specialties: ["Foils", "HiLites/LoLites"], schedule: ["By Appointment Only"], tag_line: "Lorem Ipsum Dorom", profile_pic: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/stylist_example_img.jpg")
end

def create_offerings()
    puts "Creating Offerings"
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
end

def create_clients()
    puts "Creating Clients"
    Client.create(first_name: "John", last_name: "Smith", email: "abc@def.com", password: "1234567890", password_confirmation: "1234567890", phone: "0000000000")
    Client.create(first_name: "Rebecca", last_name: "Jones", email: "example@example.com", password: "1234567890", password_confirmation: "1234567890", phone: "0000000000")
    Client.create(first_name: "Frodo", last_name: "Baggins", email: "example@sample.com", password: "1234567890", password_confirmation: "1234567890", phone: "0000000000")
end

def create_appointments()
    puts "Creating Appointments"
    (1..50).each do |i|
        puts ">>> Creating Appointment #{i} <<<"
        a = Appointment.new()
        a.seed_data() # Instance Method defined in /app/models/appoitment.rb
        a.save
    end
end

def create_all()
    create_stylists()
    create_offerings()
    create_clients()
    create_appointments()
end

create_all()










