module Orders
  class FirstMeals < OrderType
    private

    def meal_type
      Item::FIRST_MEAL
    end
  end
end
