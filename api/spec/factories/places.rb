# spec/factories/places.rb
FactoryGirl.define do
  factory :place do
    name { Faker::StarWars.character }
    stroll_id nil
  end
end
