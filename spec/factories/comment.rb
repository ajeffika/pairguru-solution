FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph}
    movie
    user
  end
end
