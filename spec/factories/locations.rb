require 'faker'

FactoryGirl.define do
  factory :location do |l|
    l.name { Faker::Address.city }
  end

  factory :badplace, parent: :location do |b|
    b.name nil
  end

  factory :admin do |a|
    a.email { Faker::Internet.email }
    a.password "password"
    a.password_confirmation "password"
    a.created_at Date.today
    a.updated_at Date.today
  end
end
