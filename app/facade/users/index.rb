# frozen_string_literal: true

module Users
  class Index
    def users
      @users ||= User.where(role: :user)
    end
  end
end
