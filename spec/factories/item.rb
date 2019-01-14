# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { Faker::Lorem.unique.word }
    meal_type { Item.meal_types.values.sample }
  end
end
