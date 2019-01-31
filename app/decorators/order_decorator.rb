# frozen_string_literal: true

class OrderDecorator < ApplicationDecorator
  delegate :name, to: :user, allow_nil: true, prefix: true

  decorates_association :meals

  def total_cost
    "$#{count_total_cost}"
  end

  def count_total_cost
    meals.inject(0) { |cost, meal| cost += meal.price }
  end

  def human_created_at
    created_at.strftime('%d.%m.%Y')
  end
end
