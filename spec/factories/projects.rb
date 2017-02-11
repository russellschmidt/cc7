require 'faker'

FactoryGirl.define do
  factory :project do
    name { Faker::Commerce.department }
    partner_id 1
    location_id 20
    blurb { Faker::ChuckNorris }
    description { Faker::TwinPeaks.quote }
  end
end
