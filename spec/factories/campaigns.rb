require 'faker'

FactoryGirl.define do
  factory :campaign do
    project_id 1
    name { Faker::StarWars.character }
    slug { "#{name}".downcase.gsub(" ","-") }
    description { Faker::StarWars.quote }
    dollar_goal { Faker::Number.decimal(4,2) }
    start_date { Faker::Date.backward(30) }
    end_date { Faker::Date.forward(30) }
    time_zone "Tijuana"
    active? true
  end

  factory :badcampaign, parent: :campaign do
    project_id 1
    name nil
    slug { "#{name}".downcase.gsub(" ","-") }
    description { Faker::StarWars.quote }
    dollar_goal { Faker::Number.decimal(4,2) }
    start_date { Faker::Date.backward(30) }
    end_date { Faker::Date.forward(30) }
    time_zone "Tijuana"
    active? true
  end
end
