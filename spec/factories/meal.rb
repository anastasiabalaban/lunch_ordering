# frozen_string_literal: true

FactoryBot.define do
  factory :meal do
    item
    menu
    price { Faker::Number.positive }
  end
end
