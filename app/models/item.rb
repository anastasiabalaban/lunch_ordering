class Item < ApplicationRecord
  enum meal_type: {
    first_meal: FIRST_MEAL = 'first',
    main_meal:  MAIN_MEAL  = 'main',
    drink:      DRINK      = 'drink'
  }

  has_many :meals, inverse_of: :item, dependent: :destroy
  has_many :menus, through: :meals

  has_many :meals_orders
  has_many :orders, through: :meals_orders

  validates :name, uniqueness: true, presence: true
  validates :meal_type, presence: true
end
