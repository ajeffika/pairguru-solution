FactoryBot.define do
  factory :movie do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    released_at { Faker::Date.between(from: 40.years.ago, to: Time.zone.today) }
    genre
  end
end
