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

ActiveRecord::Schema.define(:version => 20121120151935) do

  create_table "table", :force => true do |t|
    t.string   "column",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "badge_sets", :force => true do |t|
    t.string   "name",     :null => false
    t.string "source", :null => true
    t.string "image", :null => true
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "badges", :force => true do |t|
    t.string "name", :null => false
    t.string "surname", :null => true
    t.string "profession", :null => true
    t.string   "company",     :null => false
    t.integer "badge_set_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index :badges, :badge_set_id

end
