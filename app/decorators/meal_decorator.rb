class MealDecorator < Draper::Decorator
  delegate :id

  def meal_name_and_price
    "#{item_name} : $#{price}"
  end

  private

  def item_name
    object.item.name
  end

  def price
    object.price
  end
end
