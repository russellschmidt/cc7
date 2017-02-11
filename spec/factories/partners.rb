require 'faker'

FactoryGirl.define do
  factory :partner do |p|
    p.name { Faker::Company.name }
    p.logo_aws_url { Faker::Internet.url }
  end

  factory :badpartner, parent: :partner do |b|
    b.name nil
  end
end
