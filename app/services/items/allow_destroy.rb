# frozen_string_literal: true

module Items
  class AllowDestroy < ApplicationService
    initialize_with :item

    def call
      item.meals.includes(:meals_orders).none?
    end
  end
end
