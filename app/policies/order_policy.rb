class OrderPolicy < ApplicationPolicy
  def create?
    current_menu
  end

  alias_method :new?, :create?
end
