class Meal < ApplicationRecord
  belongs_to :item
  belongs_to :menu

  has_many :meals_orders
  has_many :orders, through: :meals_orders

  accepts_nested_attributes_for :item, reject_if: :all_blank
  
  validates :price, numericality: { greater_than: 0 }
end
