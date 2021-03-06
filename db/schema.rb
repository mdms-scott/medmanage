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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101115210913) do

  create_table "allergies", :force => true do |t|
    t.string   "name"
    t.string   "kind"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drugs", :force => true do |t|
    t.string   "name"
    t.string   "kind"
    t.string   "code"
    t.string   "generic_for"
    t.string   "purpose"
    t.text     "interactions", :default => "[]"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medications", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "drug_id"
    t.string   "prescribing"
    t.integer  "prescription"
    t.integer  "dose"
    t.integer  "quantity"
    t.datetime "filled_on"
    t.integer  "refills"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.datetime "dob"
    t.string   "sex"
    t.integer  "ssn"
    t.string   "insurance"
    t.string   "attending"
    t.string   "primary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
