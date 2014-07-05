# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "The Tipping Point #{n}" }
    author "Malcolm Gladwell"
    year 2000
  end
end
