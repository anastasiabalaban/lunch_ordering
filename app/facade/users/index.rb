# frozen_string_literal: true

module Users
  class Index
    def users
      @users ||= User.where(role: User::USER)
    end
  end
end
