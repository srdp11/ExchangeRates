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

ActiveRecord::Schema.define(version: 20170123144519) do

  create_table "clients", force: :cascade do |t|
    t.string   "email"
    t.string   "fromto"
    t.string   "condition"
    t.float    "threshold"
    t.float    "last_notification_value"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "operation"
  end

  create_table "rates", force: :cascade do |t|
    t.float    "usd_sell"
    t.float    "usd_buy"
    t.float    "eur_sell"
    t.float    "eur_buy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
