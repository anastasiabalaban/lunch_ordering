# frozen_string_literal: true

module Orders
  class Index
    def initialize(user = nil)
      @user = user
    end

    def orders
      @orders ||= Order.includes(:meals).where(user: user)
                       .order(created_at: :desc).decorate
    end

    private

    attr_reader :user
  end
end
