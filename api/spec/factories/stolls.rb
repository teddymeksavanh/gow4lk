# spec/factories/strolls.rb
FactoryGirl.define do
  factory :stroll do
    title { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
  end
end
