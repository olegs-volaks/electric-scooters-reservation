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

ActiveRecord::Schema[7.0].define(version: 2022_07_24_215058) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "subscribe", default: true, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_employees_on_deleted_at"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "scooter_id"
    t.bigint "employee_id"
    t.datetime "from", null: false
    t.datetime "to", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_reservations_on_deleted_at"
    t.index ["employee_id"], name: "index_reservations_on_employee_id"
    t.index ["from"], name: "index_reservations_on_from"
    t.index ["scooter_id"], name: "index_reservations_on_scooter_id"
    t.index ["to"], name: "index_reservations_on_to"
  end

  create_table "scooters", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_scooters_on_deleted_at"
  end

  add_foreign_key "reservations", "employees"
  add_foreign_key "reservations", "scooters"
end
