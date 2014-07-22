class CollapsedMigrations < ActiveRecord::Migration

  def self.up
    create_table "accounts", force: true do |t|
      t.string   "name"
      t.integer  "primary_contact_id"
      t.boolean  "active"
      t.decimal  "balance"
      t.datetime "created_at"
      t.datetime "updated_at"
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

  def self.down
    raise IrreversibleMigration
  end


end