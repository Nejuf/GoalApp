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

ActiveRecord::Schema.define(:version => 20131018234510) do

  create_table "cheers", :force => true do |t|
    t.integer  "goal_id",    :null => false
    t.integer  "user_id",    :null => false
    t.integer  "delta",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cheers", ["goal_id", "user_id"], :name => "index_cheers_on_goal_id_and_user_id", :unique => true
  add_index "cheers", ["goal_id"], :name => "index_cheers_on_goal_id"
  add_index "cheers", ["user_id"], :name => "index_cheers_on_user_id"

  create_table "goals", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.string   "name",                          :null => false
    t.boolean  "is_private", :default => false, :null => false
    t.boolean  "complete",   :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "goals", ["user_id"], :name => "index_goals_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",        :null => false
    t.string   "password_digest", :null => false
    t.string   "session_token",   :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
