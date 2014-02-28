# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo do
    user
    description "A description"
    priority 1
    due_date Date.today + 7.days
    completed false
  end
end
