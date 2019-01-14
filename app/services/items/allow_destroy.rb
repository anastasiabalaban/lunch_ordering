# frozen_string_literal: true

module Items
  class AllowDestroy < ApplicationService
    initialize_with :item

    def call
      !item.meals.includes(:meals_orders).any?
    end
  end
end
