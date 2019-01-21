# frozen_string_literal: true

FactoryBot.define do
  factory :meals_order do
    order
    meal
  end
end
