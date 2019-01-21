# frozen_string_literal: true

module Menus
  class NewCreate
    delegate :valid?, to: :menu, allow_nil: true

    def initialize(params = {})
      @params = params
    end

    def menu
      @menu ||= params.empty? ? Menu.new : Menu.create(params)
    end

    def ordered_names
      Item.order(:name)
    end

    private

    attr_reader :params
  end
end
