# frozen_string_literal: true

module Menus
  class Index
    def initialize(user = nil)
      @user = user
    end

    def menus
      @menus ||= Menu.all.decorate
    end

    def allowed_create?
      menu_policy.create?
    end

    private

    attr_reader :user

    def menu_policy
      @menu_policy ||= MenuPolicy.new(user)
    end
  end
end
