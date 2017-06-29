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

ActiveRecord::Schema.define(version: 20170507205431) do

  create_table "machines", force: :cascade do |t|
    t.string   "machineID"
    t.string   "machineDescription"
    t.string   "materialUsed"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "material_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "machineID"
    t.string   "userName"
    t.datetime "startTime"
    t.datetime "endTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
  end

  create_table "users", force: :cascade do |t|
    t.string   "userName"
    t.string   "email"
    t.string   "password"
    t.boolean  "approval",   default: false
    t.boolean  "boolean",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "admin",      default: false
    t.string   "salt"
  end

end
