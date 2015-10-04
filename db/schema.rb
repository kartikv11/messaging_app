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

ActiveRecord::Schema.define(version: 20151003114100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string   "channel_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "message_recipient_channels", force: :cascade do |t|
    t.integer  "message_id"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "message_recipient_channels", ["channel_id"], name: "index_message_recipient_channels_on_channel_id", using: :btree
  add_index "message_recipient_channels", ["message_id"], name: "index_message_recipient_channels_on_message_id", using: :btree

  create_table "message_recipient_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "message_recipient_users", ["message_id"], name: "index_message_recipient_users_on_message_id", using: :btree
  add_index "message_recipient_users", ["user_id"], name: "index_message_recipient_users_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "user_to_channel_subscriptions", force: :cascade do |t|
    t.integer  "channel_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_to_channel_subscriptions", ["channel_id"], name: "index_user_to_channel_subscriptions_on_channel_id", using: :btree
  add_index "user_to_channel_subscriptions", ["user_id"], name: "index_user_to_channel_subscriptions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email_id"
    t.boolean  "is_active"
    t.string   "team_name"
    t.string   "full_name"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "message_recipient_channels", "channels"
  add_foreign_key "message_recipient_channels", "messages"
  add_foreign_key "message_recipient_users", "messages"
  add_foreign_key "message_recipient_users", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "user_to_channel_subscriptions", "channels"
  add_foreign_key "user_to_channel_subscriptions", "users"
end
