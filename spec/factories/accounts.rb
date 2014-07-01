# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    name "MyString"
    primary_contact_id 1
    active false
    balance "9.99"
  end
end
