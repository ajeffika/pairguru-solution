FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { 'em12345678' }
    confirmed_at { DateTime.now }
  end
end
