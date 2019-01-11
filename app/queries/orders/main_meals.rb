module Orders
  class MainMeals < OrderType
    private

    def meal_type
      Item::MAIN_MEAL
    end
  end
end
