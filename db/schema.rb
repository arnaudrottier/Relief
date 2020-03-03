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

ActiveRecord::Schema.define(version: 2020_03_03_073206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "availability"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "amenity_id"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.index ["amenity_id"], name: "index_bookings_on_amenity_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "chores", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.interval "frequency", default: "168:00:00"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_chores", force: :cascade do |t|
    t.boolean "status", default: false
    t.bigint "room_id"
    t.bigint "chore_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "period"
    t.index ["chore_id"], name: "index_room_chores_on_chore_id"
    t.index ["room_id"], name: "index_room_chores_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "room_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["room_id"], name: "index_users_on_room_id"
  end

  create_table "whiteboard_messages", force: :cascade do |t|
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "amenities"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "room_chores", "chores"
  add_foreign_key "room_chores", "rooms"
  add_foreign_key "users", "rooms"
end
