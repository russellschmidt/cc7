FactoryGirl.define do
  factory :campaign do
    project_id nil
    name { Faker::Hipster.sentence(4) }
    description { Faker::Hipster.pragraph(2) }
    dollar_goal { Faker::Number.decimal(4,2) }
    start_date { Faker::Date.backward(365)}
    end_date { Faker::Date.forward(365) }
    timezone
    active? false
    slug "MyString"
  end

  factory :badcampaign, parent: :campaign do
    project_id nil
    name nil
    description "MyText"
    dollar_goal "9.99"
    start_date "2017-02-12 18:20:30"
    end_date "2017-02-12 18:20:30"
    timezone "MyString"
    active? false
    slug "MyString"
  end
end
