require 'faker'

FactoryGirl.define do

  factory :location do |l|
    l.name { Faker::Address.city }
  end

  factory :badplace, parent: :location do |b|
    b.name nil
  end

end
