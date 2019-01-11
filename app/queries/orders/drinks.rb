module Orders
  class Drinks < OrderType
    private

    def meal_type
      Item::DRINK
    end
  end
end
