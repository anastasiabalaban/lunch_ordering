# frozen_string_literal: true

class MealDecorator < ApplicationDecorator
  delegate :name, to: :item, allow_nil: true, prefix: true

  def meal_name_and_price
    "#{item_name} : $#{price}"
  end
end
