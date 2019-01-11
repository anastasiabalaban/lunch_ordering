# frozen_string_literal: true

module Orders
  class NewCreate
    def initialize(user = nil, params = {})
      @user   = user
      @params = params
    end

    def order
      @order ||= params.empty? ? Order.new : user.orders.create(params)
    end

    def first_meals
      @first_meals ||= today_menu_meals.first_meals.decorate
    end

    def main_meals
      @main_meals ||= today_menu_meals.main_meals.decorate
    end

    def drinks
      @drinks ||= today_menu_meals.drinks.decorate
    end

    private

    attr_reader :user, :params

    def today_menu
      @today_menu = Menu.find_by('DATE(created_at) = ?', Date.current)
    end

    def today_menu_meals
      return Meal.none unless today_menu

      today_menu.meals.includes(:item)
    end
  end
end
