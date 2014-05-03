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

ActiveRecord::Schema.define(version: 20140427121742) do

  create_table "myclasses", force: true do |t|
    t.string   "name"
    t.string   "count"
    t.string   "teachermanage"
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notices", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "sname"
    t.string   "description"
    t.string   "pic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "specialized"
  end

  create_table "specializeds", force: true do |t|
    t.string   "name"
    t.string   "teacher"
    t.text     "intro"
    t.string   "period"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "number"
    t.string   "grade"
    t.string   "token"
    t.string   "myclass"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sex"
    t.string   "major"
  end

end
