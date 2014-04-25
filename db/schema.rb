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

ActiveRecord::Schema.define(:version => 20140423150723) do

  create_table "activities", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activities", ["owner_id", "owner_type"], :name => "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], :name => "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], :name => "index_activities_on_trackable_id_and_trackable_type"

  create_table "awards", :force => true do |t|
    t.text     "name"
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "payout_id"
    t.string   "notes"
  end

  create_table "budgets", :force => true do |t|
    t.integer  "team_id"
    t.integer  "year"
    t.integer  "amount",     :default => 130
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
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

  create_table "draft_rosters", :force => true do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "team_id"
    t.string   "title"
    t.date     "event_date"
    t.string   "event_type",  :default => "Personal"
    t.text     "description"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
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

  create_table "nfl_teams", :force => true do |t|
    t.string   "mascot"
    t.string   "conference"
    t.string   "city"
    t.string   "shorthand"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "roster_spots", :force => true do |t|
    t.integer  "draft_roster_id"
    t.integer  "player_id"
    t.integer  "position"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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
    t.boolean  "this_is_a_buyout"
  end

  create_table "super_bowl_picks", :force => true do |t|
    t.integer  "team_id"
    t.integer  "super_bowl_id"
    t.integer  "nfl_team_id"
    t.integer  "combined_total"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "super_bowls", :force => true do |t|
    t.integer  "nfl_team1_id"
    t.integer  "nfl_team2_id"
    t.boolean  "tie_breaker"
    t.integer  "nfl_team1_final_score"
    t.integer  "nfl_team2_final_score"
    t.integer  "nfl_winner_id"
    t.integer  "dopr_winner_id"
    t.integer  "year"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
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
    t.string   "email",                                               :null => false
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.boolean  "is_admin"
    t.string   "display_name"
    t.boolean  "is_current"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "role",                         :default => "regular"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                :default => 0,         :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
