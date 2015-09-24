FactoryGirl.define do
  factory :task do
    title Faker::Name.name
    description Faker::Lorem.sentence
  end

end
