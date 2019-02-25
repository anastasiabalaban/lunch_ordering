# frozen_string_literal: true

class OrderDecorator < ApplicationDecorator
  delegate :name, to: :user, allow_nil: true, prefix: true

  decorates_association :meals

  def human_total_cost
    total_cost.to_s(:currency)
  end

  def total_cost
    meals.pluck(:price).compact.reduce(0, :+)
  end

  def human_created_at
    created_at.strftime('%d.%m.%Y')
  end
end
