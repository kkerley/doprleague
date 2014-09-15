# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :annual_gm_action do
    team_id 1
    year 1
    has_extended false
    extended_player_id 1
    has_franchised false
    franchised_player_id 1
    has_bought_out false
    bought_out_player_id 1
  end
end
