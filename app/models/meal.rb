class Meal < ApplicationRecord
  MIN_PRICE = 0

  belongs_to :item
  belongs_to :menu

  has_many :meals_orders
  has_many :orders, through: :meals_orders

  scope :first_meals, Orders::FirstMeals
  scope :main_meals,  Orders::MainMeals
  scope :drinks,      Orders::Drinks

  accepts_nested_attributes_for :item, reject_if: :all_blank

  validates :price, presence: true, numericality: { greater_than: MIN_PRICE }
end
