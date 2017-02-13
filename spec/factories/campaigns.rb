FactoryGirl.define do
  factory :campaign do
    project_id nil
    name "MyString"
    description "MyText"
    dollar_goal "9.99"
    start_date "2017-02-12 18:20:30"
    end_date "2017-02-12 18:20:30"
    timezone "MyString"
    active? false
    slug "MyString"
  end
end
