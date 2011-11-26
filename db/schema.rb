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

ActiveRecord::Schema.define(:version => 20111116061914) do

  create_table "comment_photos", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     :default => 0
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",      :default => 0
  end

  create_table "first_page_posts", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     :default => 0
  end

  create_table "photo_events", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "event_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photo_events", ["photo_id", "event_id"], :name => "index_photo_events_on_photo_id_and_event_id"

  create_table "photo_users", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photo_users", ["user_id", "photo_id"], :name => "index_photo_users_on_user_id_and_photo_id"

  create_table "photos", :force => true do |t|
    t.text     "description",  :default => ""
    t.date     "date",         :default => '2011-11-16', :null => false
    t.string   "path"
    t.string   "geo_location"
    t.integer  "user_id"
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",        :default => "no present"
    t.integer  "status",       :default => 0
  end

  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",           :default => "", :null => false
    t.string   "user_name"
    t.string   "hashed_password"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_birth"
    t.string   "salt"
    t.integer  "status",          :default => 0
  end

  add_index "users", ["user_name"], :name => "index_users_on_user_name"

end
