class Meal < ApplicationRecord
  belongs_to :item
  belongs_to :menu

  has_many :meals_orders
  has_many :orders, through: :meals_orders

  scope :first_meals, -> { joins(:item).where(items: { meal_type: :first_meal } ) }
  scope :main_meals, -> { joins(:item).where(items: { meal_type: :main_meal } ) }
  scope :drinks, -> { joins(:item).where(items: { meal_type: :drink } ) }

  accepts_nested_attributes_for :item, reject_if: :all_blank

  validates :price, numericality: { greater_than: 0 }

  def select_label
    "#{item.name} : #{price}"
  end
end
