require 'faker'

FactoryGirl.define do
  factory :location do |f|
    f.name { Faker::Address.city }
  end
end
