# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    name { Faker::Lorem.unique.word }
    created_at { Faker::Time.between(10.days.ago, 2.days.ago, :all) }
    after(:create) do |menu|
      create_list(:meal, 10, menu: menu)
    end
  end

  trait :today_menu do
    created_at Date.current
  end
end
