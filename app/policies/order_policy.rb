# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  def create?
    current_menu
  end

  alias_method :new?, :create?
end
