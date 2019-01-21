# frozen_string_literal: true

module Orders
  class OrderType < ApplicationService
    def call
      Meal.joins(:item).where(items: { meal_type: meal_type })
    end
  end
end
