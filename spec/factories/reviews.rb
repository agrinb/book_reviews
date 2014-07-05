# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    sequence(:description) { |n| "This is a good book #{n}" }
    rating "5"

    book
  end
end
