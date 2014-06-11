# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trade do
    trader1_id 1
    trader2_id 1
    is_accepted false
    notes "MyText"
  end
end
