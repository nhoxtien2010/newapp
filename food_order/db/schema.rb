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

ActiveRecord::Schema.define(version: 20150331092754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "foods", ["store_id"], name: "index_foods_on_store_id", using: :btree

  create_table "order_details", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "food_id"
    t.integer  "number"
    t.integer  "totalmoney"
    t.integer  "order_session_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "order_details", ["food_id"], name: "index_order_details_on_food_id", using: :btree
  add_index "order_details", ["order_session_id"], name: "index_order_details_on_order_session_id", using: :btree
  add_index "order_details", ["user_id"], name: "index_order_details_on_user_id", using: :btree

  create_table "order_sessions", force: :cascade do |t|
    t.datetime "timecreate"
    t.datetime "timelock"
    t.integer  "totalmoney"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_sessions", ["user_id"], name: "index_order_sessions_on_user_id", using: :btree

  create_table "order_stores", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "order_session_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "order_stores", ["order_session_id"], name: "index_order_stores_on_order_session_id", using: :btree
  add_index "order_stores", ["store_id"], name: "index_order_stores_on_store_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "gender"
    t.string   "profile_picture"
    t.integer  "permission"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "foods", "stores"
  add_foreign_key "order_details", "foods"
  add_foreign_key "order_details", "order_sessions"
  add_foreign_key "order_details", "users"
  add_foreign_key "order_sessions", "users"
  add_foreign_key "order_stores", "order_sessions"
  add_foreign_key "order_stores", "stores"
end
