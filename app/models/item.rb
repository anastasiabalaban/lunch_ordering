class Item < ApplicationRecord
  enum meal_type: {
    first_meal: FIRST_MEAL = 'first',
    main_meal: MAIN_MEAL = 'main',
    drink: DRINK = 'drink'
  }

  has_many :items_menus, inverse_of: :item
  has_many :menus, through: :items_menus
  has_many :items_orders
  has_many :orders, through: :items_orders

  validates :name, :price, :meal_type, presence: true
  validates :price, numericality: { greater_than: 0 }
end
