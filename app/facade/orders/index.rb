# frozen_string_literal: true

module Orders
  class Index
    def initialize(user)
      @user = user
    end

    def orders
      @orders ||= user_orders.includes(:meals).order(created_at: :desc).decorate
    end

    private

    attr_reader :user

    delegate :orders, to: :user, allow_nil: true, prefix: true
  end
end
