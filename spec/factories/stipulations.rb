# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stipulation do
    year 1
    stipulation_type "MyString"
    terms "MyString"
    description "MyText"
    rest_of_contract false
  end
end
