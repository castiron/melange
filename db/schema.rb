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

ActiveRecord::Schema.define(version: 20140823134624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.integer  "primary_contact_id"
    t.boolean  "active"
    t.decimal  "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_individual"
  end

  create_table "api_keys", force: true do |t|
    t.string   "token"
    t.datetime "expires_at"
    t.integer  "user_id"
    t.integer  "refresh_count", default: 0
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_seen_at"
  end

  add_index "api_keys", ["token"], name: "index_api_keys_on_token", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",              default: "", null: false
    t.string   "password_digest",    default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
