# frozen_string_literal: true

module Items
  class AllowDestroy < ApplicationService
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def call
      !MealsOrder.joins(:meal).exists?(meals: { item: item })
    end
  end
end
