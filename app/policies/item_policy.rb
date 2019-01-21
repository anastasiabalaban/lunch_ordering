# frozen_string_literal: true

class ItemPolicy < ApplicationPolicy
  delegate :admin?, to: :user

  def destroy?
    user.admin? && ::Items::AllowDestroy.call(item: resource)
  end

  alias_method :index?,   :admin?
  alias_method :new?,     :admin?
  alias_method :create?,  :admin?
  alias_method :edit?,    :admin?
  alias_method :update?,  :admin?
end
