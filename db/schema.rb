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

ActiveRecord::Schema.define(version: 20151010171758) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "zip"
    t.string   "raw_line"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.date     "schedule"
    t.integer  "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "drivers", ["truck_id"], name: "index_drivers_on_truck_id"

  create_table "orders", force: :cascade do |t|
    t.string   "number"
    t.date     "delivery_date"
    t.integer  "delivery_shift"
    t.float    "volume"
    t.integer  "handling_unit_quantity"
    t.integer  "origin_point_id"
    t.integer  "destination_point_id"
    t.integer  "load_step_id"
    t.integer  "unload_step_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "orders", ["destination_point_id"], name: "index_orders_on_destination_point_id"
  add_index "orders", ["load_step_id"], name: "index_orders_on_load_step_id"
  add_index "orders", ["origin_point_id"], name: "index_orders_on_origin_point_id"
  add_index "orders", ["unload_step_id"], name: "index_orders_on_unload_step_id"

  create_table "points", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routing_lists", force: :cascade do |t|
    t.date     "delivery_date"
    t.integer  "delivery_shift"
    t.integer  "driver_id"
    t.integer  "first_step_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "routing_lists", ["driver_id"], name: "index_routing_lists_on_driver_id"
  add_index "routing_lists", ["first_step_id"], name: "index_routing_lists_on_first_step_id"

  create_table "routing_steps", force: :cascade do |t|
    t.time     "delivery_time"
    t.integer  "next_step_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "routing_steps", ["next_step_id"], name: "index_routing_steps_on_next_step_id"

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id"

  create_table "trucks", force: :cascade do |t|
    t.string   "number"
    t.float    "volume"
    t.integer  "start_address_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "trucks", ["start_address_id"], name: "index_trucks_on_start_address_id"

end
