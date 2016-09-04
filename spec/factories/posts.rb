FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    username { Faker::Internet.user_name }
  end
end
