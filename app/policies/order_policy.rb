class OrderPolicy < ApplicationPolicy
  def create?
    current_menu
  end
end
