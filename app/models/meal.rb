class Meal < ApplicationRecord
  MIN_PRICE = 0

  belongs_to :item
  belongs_to :menu

  has_many :meals_orders
  has_many :orders, through: :meals_orders

  scope :first_meals, -> { joins(:item).where(items: { meal_type: Item::FIRST_MEAL }) }
  scope :main_meals,  -> { joins(:item).where(items: { meal_type: Item::MAIN_MEAL }) }
  scope :drinks,      -> { joins(:item).where(items: { meal_type: Item::DRINK }) }

  accepts_nested_attributes_for :item, reject_if: :all_blank

  validates :price, presence: true, numericality: { greater_than: MIN_PRICE }
end
