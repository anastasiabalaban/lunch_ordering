class MenuPolicy < ApplicationPolicy
  def create?
    user.admin? && !current_menu
  end
end
