class Order < ApplicationRecord
  belongs_to :user

  has_many :meals_orders
  has_many :meals, through: :meals_orders
  has_many :first_meals, -> { Orders::FirstMeals.call }, source: :meal, through: :meals_orders
  has_many :main_meals,  -> { Orders::MainMeals.call },  source: :meal, through: :meals_orders
  has_many :drinks,      -> { Orders::Drinks.call },     source: :meal, through: :meals_orders
end
