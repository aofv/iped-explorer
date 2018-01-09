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

ActiveRecord::Schema.define(version: 20180109144009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admissions", force: :cascade do |t|
    t.integer "year"
    t.bigint "school_id"
    t.integer "applications"
    t.integer "applications_male"
    t.integer "applications_female"
    t.integer "admissions"
    t.integer "admissions_male"
    t.integer "admissions_female"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_admissions_on_school_id"
  end

  create_table "costs", force: :cascade do |t|
    t.integer "year"
    t.bigint "school_id"
    t.integer "average_in_state_tuition"
    t.integer "in_state_fees"
    t.integer "average_out_of_state_tuition"
    t.integer "out_of_stats_fees"
    t.integer "books_and_supplies"
    t.integer "on_campus_room_and_board"
    t.integer "off_campus_room_and_board"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_costs_on_school_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "school_id"
    t.integer "year"
    t.integer "level_of_student"
    t.integer "total"
    t.integer "male"
    t.integer "female"
    t.integer "american_indian"
    t.integer "american_indian_male"
    t.integer "american_indian_female"
    t.integer "asian"
    t.integer "asian_male"
    t.integer "asian_female"
    t.integer "african_american"
    t.integer "african_american_male"
    t.integer "african_american_female"
    t.integer "hispanic"
    t.integer "hispanic_male"
    t.integer "hispanic_female"
    t.integer "pacific_islander"
    t.integer "pacific_islander_male"
    t.integer "pacific_islander_female"
    t.integer "white"
    t.integer "white_male"
    t.integer "white_female"
    t.integer "two_races"
    t.integer "two_races_male"
    t.integer "two_races_women"
    t.integer "race_unknown"
    t.integer "race_unknown_male"
    t.integer "race_unknown_female"
    t.integer "non_resident"
    t.integer "non_resident_male"
    t.integer "non_resident_female"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_enrollments_on_school_id"
  end

  create_table "general_finances", force: :cascade do |t|
    t.integer "year"
    t.bigint "school_id"
    t.float "total_assets"
    t.float "total_expenses"
    t.float "total_long_term_debt"
    t.float "total_liabilities"
    t.float "tuition_revenue"
    t.float "total_revenue"
    t.float "donations"
    t.float "instruction_expenses"
    t.float "instruction_salaries"
    t.float "research_expenses"
    t.float "research_salaries"
    t.float "academic_support_expenses"
    t.float "academic_support_salaries"
    t.float "student_services_expenses"
    t.float "student_services_salaries"
    t.float "institutional_support_expenses"
    t.float "institutional_support_salaries"
    t.float "aux_expenses"
    t.float "aux_salaries"
    t.float "total_discounts"
    t.float "value_of_endowment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_general_finances_on_school_id"
  end

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

  create_table "sport_expenses", force: :cascade do |t|
    t.integer "year"
    t.bigint "school_id"
    t.integer "student_aid_men"
    t.integer "student_aid_women"
    t.integer "student_aid_total"
    t.integer "recruiting_men"
    t.integer "recruiting_women"
    t.integer "recruiting_total"
    t.integer "total_revenue"
    t.integer "total_expenses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_sport_expenses_on_school_id"
  end

  create_table "sport_teams", force: :cascade do |t|
    t.integer "year"
    t.bigint "school_id"
    t.string "sport"
    t.string "affiliation"
    t.string "division"
    t.integer "roster_size"
    t.integer "expenses"
    t.integer "revenue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_sport_teams_on_school_id"
  end

  create_table "veterans", force: :cascade do |t|
    t.integer "year"
    t.bigint "school_id"
    t.integer "total_undergraduate_students"
    t.integer "total_undergraduate_benefits"
    t.integer "average_undergraduate_benefits"
    t.integer "total_graduate_students"
    t.integer "total_graduate_benefits"
    t.integer "average_graduate_benefits"
    t.integer "total_students"
    t.integer "total_benefits"
    t.integer "average_benefits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_veterans_on_school_id"
  end

end
