class MenuPolicy < ApplicationPolicy
  def create?
    user.admin? && !current_menu
  end

  alias_method :new?, :create?
end
