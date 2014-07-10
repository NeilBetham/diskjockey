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

ActiveRecord::Schema.define(version: 20140710010855) do

  create_table "shows", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.time     "start_time"
    t.time     "stop_time"
    t.integer  "day_of_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shows", ["user_id"], name: "index_shows_on_user_id"

  create_table "song_logs", force: true do |t|
    t.string   "cd_number"
    t.string   "song_name"
    t.string   "artist"
    t.string   "genre"
    t.string   "album"
    t.integer  "score"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "song_logs", ["user_id"], name: "index_song_logs_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "phone_carrier"
    t.text     "google_api_token"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true

end
