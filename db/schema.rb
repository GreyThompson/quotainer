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

ActiveRecord::Schema.define(version: 20140509010726) do

  create_table "quotes", force: true do |t|
    t.string   "author"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "quotes", ["user_id"], name: "index_quotes_on_user_id"

  create_table "users", force: true do |t|
    t.string   "handle"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.date     "date_of_birth"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
