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

ActiveRecord::Schema.define(version: 20171220152049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "schools", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.float "lat"
    t.float "lon"
    t.integer "region"
    t.string "chief_administrator"
    t.string "chief_administrator_title"
    t.string "website"
    t.integer "control"
    t.integer "sector"
    t.integer "level"
    t.integer "highest_offering"
    t.boolean "has_undergraduate_degrees"
    t.boolean "has_graduate_degrees"
    t.boolean "grants_degrees"
    t.boolean "is_hbc"
    t.boolean "has_medical_degrees"
    t.boolean "has_hospital"
    t.boolean "admissions_open_to_public"
    t.boolean "is_closed"
    t.integer "size_category"
    t.integer "undergraduate_profile"
    t.integer "enrollment_profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
