class Order < ApplicationRecord
  belongs_to :user
  has_many :meals_orders
  has_many :meals, through: :meals_orders
  has_many :first_meals, -> { joins(:item).where(items: { meal_type: :first_meal } ) }, source: :meal, through: :meals_orders
  has_many :main_meals, -> { joins(:item).where(items: { meal_type: :main_meal } ) }, source: :meal, through: :meals_orders
  has_many :drinks, -> { joins(:item).where(items: { meal_type: :drink } ) }, source: :meal, through: :meals_orders
end
