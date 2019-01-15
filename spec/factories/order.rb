# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user
    created_at { Faker::Time }
    after(:create) do |order|
      create_list(:meals_order, 3, order: order)
    end
  end
end
