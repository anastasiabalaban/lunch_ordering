class UsersController < ApplicationController
  def index
    @users = ::Users::Index.new.users
  end
end
