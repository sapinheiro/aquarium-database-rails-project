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

ActiveRecord::Schema.define(version: 20171206162319) do

  create_table "animals", primary_key: "animal_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 45
    t.string "species", limit: 45, null: false
    t.integer "tank_id", null: false
    t.datetime "birth_date"
    t.index ["tank_id"], name: "fk_tank_animal"
  end

  create_table "employees", primary_key: "employee_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name", limit: 45, null: false
    t.string "last_name", limit: 45, null: false
    t.date "hired_date", null: false
    t.date "fired_date"
    t.float "salary", limit: 53, null: false
  end

  create_table "event_registrations", primary_key: "registration_code", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time", null: false
    t.integer "member_id", null: false
    t.integer "event_id", null: false
    t.integer "guest_count"
    t.index ["event_id"], name: "eventRegistered"
    t.index ["member_id"], name: "memberRegistering"
  end

  create_table "events", primary_key: "event_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 45, null: false
    t.string "description", limit: 200
    t.float "price", limit: 24, null: false
    t.integer "managing_employee", null: false
    t.integer "max_guests_per_person"
    t.integer "max_attending", null: false
    t.datetime "event_date", null: false
    t.index ["managing_employee"], name: "manager"
  end

  create_table "feeding_logs", primary_key: "feeding_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time", null: false
    t.string "food", limit: 45, null: false
    t.float "quantity", limit: 24, null: false
    t.integer "employee_id", null: false
    t.integer "tank_id"
    t.index ["employee_id"], name: "fk_employee_feeding"
    t.index ["tank_id"], name: "fk_tank_feeding"
  end

  create_table "habitats", primary_key: "habitat_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 45, null: false
    t.string "description", limit: 200
    t.integer "year_added", null: false
  end

  create_table "members", primary_key: "member_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name", limit: 45, null: false
    t.string "last_name", limit: 45, null: false
    t.date "date_joined", null: false
    t.date "expiration_date", null: false
    t.float "fee", limit: 53, null: false
  end

  create_table "tanks", primary_key: "tank_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 45, null: false
    t.string "description", limit: 200
    t.string "water_type", limit: 5, null: false
    t.float "volume", limit: 53, null: false
    t.float "temperature", limit: 53, null: false
    t.integer "year_built", null: false
    t.integer "habitat_id", null: false
    t.index ["habitat_id"], name: "fk_habitat_tank"
  end

  create_table "treatment_logs", primary_key: "treatment_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time", null: false
    t.string "medicine", limit: 45, null: false
    t.float "quantity", limit: 24, null: false
    t.integer "employee_id", null: false
    t.integer "animal_id", null: false
    t.index ["animal_id"], name: "fk_animal_treatment"
    t.index ["employee_id"], name: "fk_employee_treatment"
  end

  add_foreign_key "animals", "tanks", primary_key: "tank_id", name: "fk_tank_animal", on_update: :cascade, on_delete: :cascade
  add_foreign_key "event_registrations", "events", primary_key: "event_id", name: "fk_event_registration", on_update: :cascade, on_delete: :cascade
  add_foreign_key "event_registrations", "members", primary_key: "member_id", name: "fk_member_registration", on_update: :cascade, on_delete: :cascade
  add_foreign_key "events", "employees", column: "managing_employee", primary_key: "employee_id", name: "fk_employee_events", on_update: :cascade
  add_foreign_key "feeding_logs", "employees", primary_key: "employee_id", name: "fk_employee_feeding", on_update: :cascade, on_delete: :cascade
  add_foreign_key "feeding_logs", "tanks", primary_key: "tank_id", name: "fk_tank_feeding", on_update: :cascade, on_delete: :nullify
  add_foreign_key "tanks", "habitats", primary_key: "habitat_id", name: "fk_habitat_tank", on_update: :cascade, on_delete: :cascade
  add_foreign_key "treatment_logs", "animals", primary_key: "animal_id", name: "fk_animal_treatment", on_update: :cascade, on_delete: :cascade
  add_foreign_key "treatment_logs", "employees", primary_key: "employee_id", name: "fk_employee_treatment", on_update: :cascade, on_delete: :cascade
end
