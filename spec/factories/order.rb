# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    created_at { Faker::Time }

    user

    trait :with_meals do
      after(:create) do |order|
        order.meals << create(:menu, :with_meals).meals
      end
    end
  end
end
