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

ActiveRecord::Schema.define(:version => 20120215063418) do

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
    t.date     "date"
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

  create_table "photos", :force => true do |t|
    t.text     "description",          :default => ""
    t.date     "date",                 :default => '2011-11-16', :null => false
    t.string   "geo_location"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                :default => "no present"
    t.integer  "status",               :default => 0
    t.integer  "event_id"
    t.string   "c_image_file_name"
    t.string   "c_image_content_type"
    t.integer  "c_image_file_size"
    t.datetime "c_image_updated_at"
  end

  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "user_events", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_events", ["user_id", "event_id"], :name => "index_user_events_on_user_id_and_event_id"

  create_table "user_photos", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_photos", ["user_id", "photo_id"], :name => "index_photo_users_on_user_id_and_photo_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_birth"
    t.integer  "status",                                :default => 0
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt",          :limit => 128, :default => "", :null => false
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
