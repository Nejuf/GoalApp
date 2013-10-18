# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
    user_id 1
    name "lose weight"
    is_private false
    complete false
  end
end
