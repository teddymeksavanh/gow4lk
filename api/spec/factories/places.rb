# spec/factories/places.rb
FactoryGirl.define do
  factory :place do
    name { Faker::StarWars.character }
    done false
    stroll_id nil
  end
end
