class Order < ApplicationRecord
  belongs_to :user

  has_many :meals_orders
  has_many :meals, through: :meals_orders
  has_many :first_meals, -> { joins(:item).where(items: { meal_type: Item::FIRST_MEAL }) },
    source: :meal, through: :meals_orders
  has_many :main_meals, -> { joins(:item).where(items: { meal_type: Item::MAIN_MEAL }) },
    source: :meal, through: :meals_orders
  has_many :drinks, -> { joins(:item).where(items: { meal_type: Item::DRINK }) },
    source: :meal, through: :meals_orders
end
