module Orders
  class OrderType
    extend SmartInit

    is_callable

    def call
      Meal.joins(:item).where(items: { meal_type: meal_type })
    end
  end
end
