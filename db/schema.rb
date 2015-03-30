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

ActiveRecord::Schema.define(version: 20150307020044) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "apple_registrations", force: :cascade do |t|
    t.integer  "user_id",      limit: 4,     null: false
    t.text     "device_token", limit: 65535, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "apple_registrations", ["user_id"], name: "index_apple_registrations_on_user_id", using: :btree

  create_table "challenges", force: :cascade do |t|
    t.string   "latitude",   limit: 255,             null: false
    t.string   "longitude",  limit: 255,             null: false
    t.integer  "active",     limit: 4,   default: 1
    t.integer  "user1_id",   limit: 4,               null: false
    t.integer  "user2_id",   limit: 4,               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenges", ["user1_id", "active"], name: "index_challenges_on_user1_id_and_active", unique: true, using: :btree
  add_index "challenges", ["user2_id", "active"], name: "index_challenges_on_user2_id_and_active", unique: true, using: :btree

  create_table "chat_messages", force: :cascade do |t|
    t.integer  "chat_room_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.text     "message",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_rooms_users", force: :cascade do |t|
    t.integer "chat_room_id", limit: 4, null: false
    t.integer "user_id",      limit: 4, null: false
  end

  add_index "chat_rooms_users", ["user_id"], name: "index_chat_rooms_users_on_user_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "gcm_registrations", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.text     "registration_id", limit: 65535, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "gcm_registrations", ["user_id"], name: "index_gcm_registrations_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "latitude",   limit: 255, null: false
    t.string   "longitude",  limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "partner_offers", force: :cascade do |t|
    t.string   "latitude",   limit: 255,   null: false
    t.string   "longitude",  limit: 255,   null: false
    t.text     "content",    limit: 65535, null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "partner_offers_historics", force: :cascade do |t|
    t.integer  "partner_offer_id", limit: 4, null: false
    t.integer  "user_id",          limit: 4, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "partner_offers_historics", ["partner_offer_id"], name: "index_partner_offers_historics_on_partner_offer_id", using: :btree
  add_index "partner_offers_historics", ["user_id"], name: "index_partner_offers_historics_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token",   limit: 255
    t.integer  "points",                 limit: 4,   default: 0
    t.string   "photo",                  limit: 255
    t.string   "photo_model",            limit: 255
    t.string   "username",               limit: 255
    t.integer  "role",                   limit: 4,   default: 0
    t.integer  "status",                 limit: 4,   default: 0
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
