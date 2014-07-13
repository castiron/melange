# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :api_key do
    token ""
    expires_at ""
    user_id ""
    refresh_count "0"
    ip_address "127.0.0.1"
  end
end
