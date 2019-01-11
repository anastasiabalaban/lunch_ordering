class ItemPolicy < ApplicationPolicy
  delegate :admin?, to: :user

  alias_method :index?,   :admin?
  alias_method :new?,     :admin?
  alias_method :create?,  :admin?
  alias_method :edit?,    :admin?
  alias_method :update?,  :admin?
  alias_method :destroy?, :admin?
end
