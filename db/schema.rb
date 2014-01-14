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

ActiveRecord::Schema.define(:version => 20140113160631) do

  create_table "awards", :force => true do |t|
    t.text     "name"
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "payout_id"
    t.string   "notes"
  end

  create_table "contracts", :force => true do |t|
    t.integer  "player_id"
    t.integer  "contract_start_year"
    t.integer  "contract_length"
    t.boolean  "is_bought_out"
    t.integer  "bought_out_by_team_id"
    t.boolean  "is_extended"
    t.boolean  "is_franchised"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.boolean  "is_dead_money"
    t.boolean  "is_drafted"
  end

  create_table "features", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "homepage_order"
    t.boolean  "on_homepage"
    t.boolean  "show_title"
    t.string   "feature_type"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
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
    t.integer  "user_id",              :default => 1
  end

  create_table "payouts", :force => true do |t|
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nfl_team"
    t.string   "position"
    t.integer  "auction_value"
    t.string   "bye_week"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "salary_progressions", :force => true do |t|
    t.integer  "auction_value"
    t.integer  "year2"
    t.integer  "year3"
    t.integer  "year4"
    t.integer  "year5"
    t.integer  "year6"
    t.integer  "year7"
    t.integer  "year8"
    t.integer  "year9"
    t.integer  "year10"
    t.integer  "year11"
    t.integer  "year12"
    t.integer  "year13"
    t.integer  "year14"
    t.integer  "year15"
    t.integer  "year16"
    t.integer  "year17"
    t.integer  "year18"
    t.integer  "year19"
    t.integer  "year20"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "standings", :force => true do |t|
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subcontracts", :force => true do |t|
    t.integer  "team_id"
    t.integer  "contract_id"
    t.integer  "salary_amount"
    t.integer  "contract_year"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.boolean  "this_is_an_extension"
    t.boolean  "this_is_a_franchise_tag"
  end

  create_table "team_records", :force => true do |t|
    t.integer  "team_id"
    t.integer  "standing_id"
    t.string   "rank"
    t.string   "wlt"
    t.float    "pct"
    t.string   "division_record"
    t.float    "pts_for"
    t.float    "pts_against"
    t.string   "streak"
    t.integer  "moves"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "team_name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "division"
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
