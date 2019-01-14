# frozen_string_literal: true

module Items
  class AllowDestroy < ApplicationService
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def call
      !item.meals.includes(:meals_orders).any?
    end
  end
end
