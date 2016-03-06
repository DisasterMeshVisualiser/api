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

ActiveRecord::Schema.define(version: 20160306152621) do

  create_table "mesh_codes", force: :cascade do |t|
    t.string   "value"
    t.integer  "rank"
    t.float    "southwest_lat"
    t.float    "southwest_long"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "mesh_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "label",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meshes", force: :cascade do |t|
    t.string   "value"
    t.integer  "mesh_type_id"
    t.integer  "mesh_code_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "meshes", ["mesh_code_id"], name: "index_meshes_on_mesh_code_id"
  add_index "meshes", ["mesh_type_id"], name: "index_meshes_on_mesh_type_id"

end
