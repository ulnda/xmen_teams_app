FactoryGirl.define do
  factory :mutant do
    name Faker::Name.name
    description Faker::Lorem.sentence
  end

end
