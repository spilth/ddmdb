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

ActiveRecord::Schema.define(version: 20131214000313) do

  create_table "miniatures", force: true do |t|
    t.string   "name"
    t.integer  "type_id"
    t.integer  "subtype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "release_id"
    t.integer  "number"
  end

  add_index "miniatures", ["release_id"], name: "index_miniatures_on_release_id"
  add_index "miniatures", ["subtype_id"], name: "index_miniatures_on_subtype_id"
  add_index "miniatures", ["type_id"], name: "index_miniatures_on_type_id"

  create_table "releases", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subtypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
