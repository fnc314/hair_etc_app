# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140419085128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appoffs", force: true do |t|
    t.integer  "appointment_id"
    t.integer  "offering_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appoffs", ["appointment_id"], name: "index_appoffs_on_appointment_id", using: :btree
  add_index "appoffs", ["offering_id"], name: "index_appoffs_on_offering_id", using: :btree

  create_table "appointments", force: true do |t|
    t.datetime "appt_date_time", null: false
    t.integer  "client_id"
    t.integer  "stylist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["client_id"], name: "index_appointments_on_client_id", using: :btree
  add_index "appointments", ["stylist_id"], name: "index_appointments_on_stylist_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",                           null: false
    t.string   "phone",                  default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
  end

  add_index "clients", ["authentication_token"], name: "index_clients_on_authentication_token", using: :btree
  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "offerings", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 4, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stylists", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone",                   default: "4127219550"
    t.integer  "years",                   default: 0
    t.string   "title",                   default: "Stylist"
    t.string   "bio_short",   limit: 175
    t.text     "bio_full"
    t.text     "schedule",                default: ["Saturday"],                                                                         null: false, array: true
    t.text     "specialties",             default: [],                                                                                   null: false, array: true
    t.string   "profile_pic",             default: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/stylist_example_img.jpg"
    t.text     "photos",                  default: [],                                                                                   null: false, array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
