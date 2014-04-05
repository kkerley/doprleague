# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :roster_spot do
    draft_roster_id 1
    player_id 1
    position 1
  end
end
