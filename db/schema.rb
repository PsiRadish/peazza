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

ActiveRecord::Schema.define(version: 20150729022834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["person_id"], name: "index_accounts_on_person_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer "friender_id"
    t.integer "friend_id"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people_hate_toppings", id: false, force: true do |t|
    t.integer  "person_id"
    t.integer  "topping_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people_hate_toppings", ["person_id"], name: "index_people_hate_toppings_on_person_id", using: :btree
  add_index "people_hate_toppings", ["topping_id"], name: "index_people_hate_toppings_on_topping_id", using: :btree

  create_table "people_meh_toppings", id: false, force: true do |t|
    t.integer  "person_id"
    t.integer  "topping_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people_meh_toppings", ["person_id"], name: "index_people_meh_toppings_on_person_id", using: :btree
  add_index "people_meh_toppings", ["topping_id"], name: "index_people_meh_toppings_on_topping_id", using: :btree

  create_table "people_need_toppings", id: false, force: true do |t|
    t.integer  "person_id"
    t.integer  "topping_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people_need_toppings", ["person_id"], name: "index_people_need_toppings_on_person_id", using: :btree
  add_index "people_need_toppings", ["topping_id"], name: "index_people_need_toppings_on_topping_id", using: :btree

  create_table "people_want_toppings", id: false, force: true do |t|
    t.integer  "person_id"
    t.integer  "topping_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people_want_toppings", ["person_id"], name: "index_people_want_toppings_on_person_id", using: :btree
  add_index "people_want_toppings", ["topping_id"], name: "index_people_want_toppings_on_topping_id", using: :btree

  create_table "toppings", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
