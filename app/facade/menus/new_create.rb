# frozen_string_literal: true

module Menus
  class NewCreate
    def initialize(params = {})
      @params = params
    end

    def new_menu
      if params.empty?
        @menu ||= Menu.new
      else
        @menu ||= Menu.create(params)
      end
    end

    private

    attr_reader :params
  end
end
