FactoryBot.define do
  factory :mix do
    title { Faker::Lorem.word }
    url { Faker::Internet.url }
  end
end
