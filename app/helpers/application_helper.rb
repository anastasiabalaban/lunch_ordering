# frozen_string_literal: true

module ApplicationHelper
  def allowed_order?
    policy(Order.new).create?
  end
end
