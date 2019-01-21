# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name      { Faker::Food.unique.ingredient }
    meal_type { Item.meal_types.values.sample }

    Item.meal_types.keys.each do |type|
      trait(type.to_sym) { meal_type type }
    end
  end
end
