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

ActiveRecord::Schema.define(version: 20150623053611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "searches", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "demographic"
    t.float    "lat"
    t.float    "long"
    t.integer  "walkscore"
    t.float    "income_below_poverty"
    t.float    "median_income"
    t.float    "income_less_than_25"
    t.float    "income_between_25_to_50"
    t.float    "income_between_50_to_100"
    t.float    "income_between_100_to_200"
    t.float    "income_greater_200"
    t.float    "education_high_school_graduate"
    t.float    "education_bachelor_or_greater"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
