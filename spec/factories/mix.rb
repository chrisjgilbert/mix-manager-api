FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.word }
  end

  factory :mix do
    title { Faker::Lorem.word }
    url { Faker::Internet.url }

    after(:create) do |mix|
      mix.tags << FactoryBot.create(:tag)
    end
  end
end
