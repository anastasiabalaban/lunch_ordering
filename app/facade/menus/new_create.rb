# frozen_string_literal: true

module Menus
  class NewCreate
    def initialize(params = {})
      @params = params
    end

    def new_menu
      return @menu ||= Menu.new if params.empty?
      @menu ||= Menu.create(params)
    end

    private

    attr_reader :params
  end
end
