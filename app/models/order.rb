class Order < ApplicationRecord
  belongs_to :user
  has_many :items_orders
  # has_many :items, through: :items_orders
  has_many :first_meals, -> { first_meal }, source: :item, through: :items_orders
  has_many :main_meals, -> { main_meal }, source: :item, through: :items_orders
  has_many :drinks, -> { drink }, source: :item, through: :items_orders
end
