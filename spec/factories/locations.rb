require 'faker'

FactoryGirl.define do
  factory :location do |f|
    f.name { Faker::Address.city }
  end

  factory :invalid_location do |f|
    f.name nil
  end
end
