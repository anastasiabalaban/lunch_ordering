# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    name       { Faker::Lorem.unique.word }
    created_at { Faker::Time.between(10.days.ago, 2.days.ago, :all) }

    trait :today_menu do
      created_at { Date.current }
    end

    trait :with_meals do
      after(:create) do |menu|
        Item.meal_types.keys.each do |type|
          menu.meals << create(:meal, type.to_sym)
        end
      end
    end
  end
end
