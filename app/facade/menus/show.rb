# frozen_string_literal: true

module Menus
  class Show
    delegate :name, to: :menu, allow_nil: true, prefix: true

    def initialize(params)
      @id = params[:id]
    end

    def first_meals
      @first_meals ||= meals.first_meals.decorate
    end

    def main_meals
      @main_meals ||= meals.main_meals.decorate
    end

    def drinks
      @drinks ||= meals.drinks.decorate
    end

    def orders
      @orders ||= Order.joins(:meals).includes(:user)
                       .where(meals: { menu: menu }).decorate.uniq
    end

    def total_order_cost
      orders.inject(0) { |cost, order| cost += order.count_total_cost }
    end

    private

    attr_reader :id

    def menu
      @menu = Menu.find(id)
    end

    def meals
      @meals = menu&.meals&.includes(:item)
    end
  end
end
