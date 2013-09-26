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

ActiveRecord::Schema.define(:version => 20130921201824) do

  create_table "awards", :force => true do |t|
    t.text     "name"
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "payout_id"
    t.string   "notes"
  end

  create_table "features", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "homepage_order"
    t.boolean  "on_homepage"
    t.boolean  "show_title"
    t.string   "feature_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.boolean  "is_published"
    t.string   "url_path"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "excerpt"
    t.string   "image_classes"
    t.boolean  "highlighted_post"
    t.string   "subtitle"
    t.boolean  "category_one_on"
    t.boolean  "category_two_on"
    t.boolean  "category_three_on"
    t.string   "category_one_text"
    t.string   "category_two_text"
    t.string   "category_three_text"
    t.string   "category_one_class"
    t.string   "category_two_class"
    t.string   "category_three_class"
  end

  create_table "payouts", :force => true do |t|
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "team_name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                        :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.boolean  "is_admin"
    t.string   "display_name"
    t.boolean  "is_current"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
