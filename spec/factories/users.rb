require 'faker'

FactoryGirl.define do
  factory :admin do |a|
    a.email { Faker::Internet.email }
    a.password "password"
    a.password_confirmation "password"
    a.created_at Date.today
    a.updated_at Date.today
  end

  factory :donor do |d|
    d.email { Faker::Internet.email }
    d.password "password"
    d.password_confirmation "password"
    d.created_at Date.today
    d.updated_at Date.today
  end
end
