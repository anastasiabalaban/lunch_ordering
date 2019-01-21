# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!

  def not_found
    raise ActiveRecord::RecordNotFound.new('Not Found')
  end
end
