# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    created_at { Faker::Time }

    user

    # trait :with_meals_orders do
    #   after(:create) do |order|
    #     create_list(:meals_order, 3, order: order)
    #   end
    # end

    trait :with_first_meal do
      after(:create) do |order|
        order.meals << create(:meal, type.to_sym)
      end
    end
  end
end
