class UsersController < ApplicationController
  def index
    @facade = ::Users::Index.new
  end
end
