# frozen_string_literal: true

module Menus
  class Show
    delegate :name, to: :menu, prefix: true

    def initialize(id)
      @id = id
    end

    def first_meals
      @first_meals = meals.first_meals.decorate
    end

    def main_meals
      @main_meals = meals.main_meals.decorate
    end

    def drinks
      @drinks = meals.drinks.decorate
    end

    private

    attr_reader :id

    def menu
      @menu ||= Menu.find_by(id: id)
    end

    def meals
      @meals = menu.meals.includes(:item)
    end
  end
end
