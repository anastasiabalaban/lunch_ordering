module ApplicationHelper
  def allowed_order?
    policy(Order.new).create?
  end
end
