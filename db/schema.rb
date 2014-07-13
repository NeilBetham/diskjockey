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

ActiveRecord::Schema.define(version: 20140713215250) do

  create_table "discrepancy_logs", force: true do |t|
    t.integer  "user_id"
    t.string   "song_name"
    t.string   "artist"
    t.string   "word"
    t.string   "cd_number"
    t.boolean  "button_pressed", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "show_id"
  end

  add_index "discrepancy_logs", ["show_id"], name: "index_discrepancy_logs_on_show_id"
  add_index "discrepancy_logs", ["user_id"], name: "index_discrepancy_logs_on_user_id"

  create_table "dj_applications", force: true do |t|
    t.string   "show_name"
    t.text     "bands_or_artists_played"
    t.string   "show_genre"
    t.text     "show_blurb"
    t.datetime "training_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dj_applications_users", id: false, force: true do |t|
    t.integer "dj_application_id"
    t.integer "user_id"
  end

  create_table "dj_schedules", force: true do |t|
    t.date     "start_date"
    t.date     "stop_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dj_slots", force: true do |t|
    t.integer  "dj_schedule_id"
    t.time     "start_time"
    t.time     "stop_time"
    t.integer  "day_of_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dj_slots", ["dj_schedule_id"], name: "index_dj_slots_on_dj_schedule_id"

  create_table "show_archives", force: true do |t|
    t.integer  "show_id"
    t.text     "file"
    t.text     "location"
    t.boolean  "error"
    t.text     "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_archives", ["show_id"], name: "index_show_archives_on_show_id"

  create_table "shows", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.time     "start_time"
    t.time     "stop_time"
    t.integer  "day_of_week"
    t.text     "bands_or_artists_played"
    t.string   "show_genre"
    t.text     "show_blurb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dj_slot_id"
  end

  add_index "shows", ["dj_slot_id"], name: "index_shows_on_dj_slot_id"
  add_index "shows", ["user_id"], name: "index_shows_on_user_id"

  create_table "shows_users", id: false, force: true do |t|
    t.integer "show_id"
    t.integer "user_id"
  end

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

  create_table "sub_lists", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_lists_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "sub_list_id"
  end

  add_index "sub_lists_users", ["sub_list_id"], name: "index_sub_lists_users_on_sub_list_id"
  add_index "sub_lists_users", ["user_id"], name: "index_sub_lists_users_on_user_id"

  create_table "tokens", force: true do |t|
    t.integer  "user_id"
    t.text     "token"
    t.datetime "valid_till"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id"

  create_table "user_events", force: true do |t|
    t.integer  "user_id"
    t.string   "event_type"
    t.string   "event_title"
    t.text     "event_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_events", ["user_id"], name: "index_user_events_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "phone_carrier"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semesters_on_air"
    t.text     "relevant_experience"
    t.string   "employment_status"
    t.boolean  "station_staff",       default: false
    t.text     "confirmation_token"
    t.boolean  "confirmed",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true

end
