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

ActiveRecord::Schema.define(:version => 20120818154335) do

  create_table "categories", :force => true do |t|
    t.string   "cname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "todo_id"
  end

  create_table "categories_todos", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "todo_id"
  end

  create_table "doings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "todo_id"
    t.boolean  "done"
    t.boolean  "do"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.binary   "photofile"
    t.boolean  "enabled"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "todo_id"
  end

  create_table "todos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.integer  "wiki_id"
    t.integer  "category_id"
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.date     "born"
    t.string   "city"
    t.boolean  "enabled"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "wikis", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "todo_id"
    t.binary   "photo_id"
    t.string   "content"
  end

  add_index "wikis", ["todo_id", "created_at"], :name => "index_wikis_on_todo_id_and_created_at"

end
