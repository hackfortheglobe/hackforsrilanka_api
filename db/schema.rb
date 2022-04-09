# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_09_192618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "powercut_schedules", force: :cascade do |t|
    t.datetime "starting_period", null: false
    t.datetime "ending_period", null: false
    t.string "group_name", null: false
    t.string "unique_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.decimal "latitude", null: false
    t.decimal "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_stations_on_latitude_and_longitude"
  end

  create_table "user_submissions", force: :cascade do |t|
    t.bigint "station_id", null: false
    t.integer "wait_time"
    t.integer "gas_type", null: false
    t.integer "availability", null: false
    t.integer "upvotes", default: 0
    t.integer "downvotes", default: 0
    t.datetime "submitted_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_user_submissions_on_station_id"
  end

  add_foreign_key "user_submissions", "stations"
end
