# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :description do |n|
    "Description #{n}"
  end

  factory :todo do
    user
    description
    priority 1
    due_date Date.today + 7.days
    completed false
  end
end
