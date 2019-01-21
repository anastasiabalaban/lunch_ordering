# frozen_string_literal: true

class Item < ApplicationRecord
  enum meal_type: {
    first_meal: FIRST_MEAL = 'first',
    main_meal:  MAIN_MEAL  = 'main',
    drink:      DRINK      = 'drink'
  }

  has_many :meals, inverse_of: :item, dependent: :destroy
  has_many :menus, through: :meals

  validates :name, uniqueness: true, presence: true
  validates :meal_type, presence: true
end
