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

ActiveRecord::Schema.define(version: 20140430130220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "events", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start"
    t.datetime "end"
    t.string   "description"
  end

  add_index "events", ["end"], name: "index_events_on_end", using: :btree
  add_index "events", ["start"], name: "index_events_on_start", using: :btree

  create_table "kegs", force: true do |t|
    t.string   "name"
    t.float    "volume"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "start_raw"
    t.float    "end_raw"
    t.float    "zero_raw"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "abv"
    t.string   "info_link"
  end

  create_table "weight_data_feed_infos", force: true do |t|
    t.float    "last_received_raw"
    t.datetime "last_received_created_at"
    t.float    "last_stored_raw"
    t.datetime "last_stored_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "keg_id"
  end

  create_table "weights", force: true do |t|
    t.float    "raw"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "keg_id"
  end

  add_index "weights", ["keg_id"], name: "index_weights_on_keg_id", using: :btree

end
