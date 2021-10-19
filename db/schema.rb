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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_type", id: :serial, force: :cascade do |t|
    t.string "make", limit: 255, null: false
    t.string "model", limit: 255, null: false
  end

  create_table "cars", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "city", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.index ["name"], name: "city_name_key", unique: true
  end

  create_table "reservations", id: :serial, force: :cascade do |t|
    t.boolean "reserve", null: false
    t.datetime "date"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "user_name", limit: 50, null: false
    t.string "password", limit: 50, null: false
    t.boolean "isadmin", null: false
  end

  add_foreign_key "car_type", "cars", column: "id", name: "car_type_id_fkey"
  add_foreign_key "reservations", "cars", column: "id", name: "reservations_id_fkey"
  add_foreign_key "reservations", "users", column: "id", name: "reservations_id_fkey1"
  add_foreign_key "users", "users", column: "id", name: "users_id_fkey"
end
