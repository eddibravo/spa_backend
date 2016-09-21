FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    association :user, :factory => :user
  end
end
