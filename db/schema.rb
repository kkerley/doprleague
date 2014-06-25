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

ActiveRecord::Schema.define(:version => 20140625031012) do

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

  create_table "conversations", :force => true do |t|
    t.string   "subject",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
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

  create_table "messaging_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "messaging_users", ["email"], :name => "index_messaging_users_on_email", :unique => true
  add_index "messaging_users", ["reset_password_token"], :name => "index_messaging_users_on_reset_password_token", :unique => true

  create_table "nfl_teams", :force => true do |t|
    t.string   "mascot"
    t.string   "conference"
    t.string   "city"
    t.string   "shorthand"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "bye_week"
  end

  create_table "notifications", :force => true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              :default => ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                :default => false
    t.datetime "updated_at",                              :null => false
    t.datetime "created_at",                              :null => false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               :default => false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], :name => "index_notifications_on_conversation_id"

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

  add_index "players", ["auction_value"], :name => "index_players_on_auction_value"
  add_index "players", ["first_name"], :name => "index_players_on_first_name"
  add_index "players", ["last_name"], :name => "index_players_on_last_name"
  add_index "players", ["nfl_team"], :name => "index_players_on_nfl_team"
  add_index "players", ["position"], :name => "index_players_on_position"

  create_table "receipts", :force => true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                                  :null => false
    t.boolean  "is_read",                       :default => false
    t.boolean  "trashed",                       :default => false
    t.boolean  "deleted",                       :default => false
    t.string   "mailbox_type",    :limit => 25
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "receipts", ["notification_id"], :name => "index_receipts_on_notification_id"

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

  create_table "stipulations", :force => true do |t|
    t.integer  "trade_id"
    t.integer  "year"
    t.string   "stipulation_type"
    t.string   "terms"
    t.text     "description"
    t.boolean  "rest_of_contract"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "trade_direction"
    t.integer  "player_id"
    t.integer  "trader1_budget_id"
    t.integer  "trader2_budget_id"
  end

  add_index "stipulations", ["trader1_budget_id", "trader2_budget_id"], :name => "index_stipulations_on_trader1_budget_id_and_trader2_budget_id"

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

  create_table "trades", :force => true do |t|
    t.integer  "trader1_id"
    t.integer  "trader2_id"
    t.boolean  "trader1_accepted"
    t.text     "notes"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "trader2_accepted"
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

  add_foreign_key "notifications", "conversations", name: "notifications_on_conversation_id"

  add_foreign_key "receipts", "notifications", name: "receipts_on_notification_id"

end
