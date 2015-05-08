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

ActiveRecord::Schema.define(version: 20150508200900) do

  create_table "comments", force: :cascade do |t|
    t.text     "text",       limit: 65535
    t.integer  "event_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "event_admins", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "event_admins", ["event_id"], name: "index_event_admins_on_event_id", using: :btree
  add_index "event_admins", ["user_id"], name: "index_event_admins_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "location",            limit: 255
    t.text     "description",         limit: 65535
    t.string   "title",               limit: 255
    t.string   "avatar",              limit: 255
    t.date     "date"
    t.time     "time"
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "group_id",            limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "events", ["group_id"], name: "index_events_on_group_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "group_memebers", force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "group_memebers", ["group_id"], name: "index_group_memebers_on_group_id", using: :btree
  add_index "group_memebers", ["user_id"], name: "index_group_memebers_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "topicname",           limit: 255
    t.text     "description",         limit: 65535
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar",              limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "tag_groups", force: :cascade do |t|
    t.integer  "tag_id",     limit: 4
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "tag_groups", ["group_id"], name: "index_tag_groups_on_group_id", using: :btree
  add_index "tag_groups", ["tag_id"], name: "index_tag_groups_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.string   "gender",     limit: 255
    t.integer  "age",        limit: 4
    t.string   "city",       limit: 255
    t.string   "country",    limit: 255
    t.string   "avatar",     limit: 255
    t.string   "isadmin",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "event_admins", "events"
  add_foreign_key "event_admins", "users"
  add_foreign_key "events", "groups"
  add_foreign_key "events", "users"
  add_foreign_key "group_memebers", "groups"
  add_foreign_key "group_memebers", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "tag_groups", "groups"
  add_foreign_key "tag_groups", "tags"
end
