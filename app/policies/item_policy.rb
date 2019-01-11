class ItemPolicy < ApplicationPolicy
  def admin
    user.admin?
  end

  alias_method :index?,   :admin
  alias_method :create?,  :admin
  alias_method :update?,  :admin
  alias_method :destroy?, :admin
end
