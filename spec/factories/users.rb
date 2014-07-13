# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'office@castironcoding.com'
    password 'testtest123'
    first_name 'John'
    last_name 'Rainbow'
  end
end
