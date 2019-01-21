# frozen_string_literal: true

FactoryBot.define do
  factory :meal do
    price { Faker::Number.positive }

    item
    menu

    Item.meal_types.keys.each do |type|
      trait(type.to_sym) do
        before(:create) do |meal|
          create(:item, type.to_sym).meals << meal
        end
      end
    end
  end
end
