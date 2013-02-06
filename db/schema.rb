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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130206034904) do

  create_table "as_req", :force => true do |t|
    t.string   "data_item"
    t.string   "market"
    t.string   "resource_name"
    t.datetime "opr_date"
    t.integer  "interval_num"
    t.decimal  "value",         :precision => 8, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "as_req", ["data_item", "market", "resource_name", "opr_date", "interval_num"], :name => "add_uniqueness_to_as_req", :unique => true

  create_table "ene_slrs", :force => true do |t|
    t.string   "data_item"
    t.string   "market"
    t.string   "resource_name"
    t.datetime "opr_date"
    t.integer  "interval_num"
    t.decimal  "value",         :precision => 8, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "ene_slrs", ["data_item", "market", "resource_name", "opr_date", "interval_num"], :name => "add_uniqueness_to_ene_slrs", :unique => true

  create_table "entities", :force => true do |t|
    t.string   "data_item"
    t.string   "resource_name"
    t.datetime "opr_date"
    t.integer  "interval_num"
    t.decimal  "value",         :precision => 8, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "entities", ["data_item", "resource_name", "opr_date", "interval_num"], :name => "add_uniqueness_to_entities", :unique => true
  add_index "entities", ["data_item"], :name => "index_entities_on_data_item"

  create_table "lmp_prc_rtms", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prc_lmp_dam", :force => true do |t|
    t.string   "data_item"
    t.string   "resource_name"
    t.datetime "opr_date"
    t.integer  "interval_num"
    t.decimal  "value",         :precision => 8, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "prc_lmp_dam", ["data_item", "resource_name", "opr_date", "interval_num"], :name => "add_uniqueness_to_prc_lmp_dam", :unique => true

  create_table "prc_lmp_rtm", :force => true do |t|
    t.string   "data_item"
    t.string   "resource_name"
    t.datetime "opr_date"
    t.integer  "interval_num"
    t.decimal  "value",         :precision => 8, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

end
