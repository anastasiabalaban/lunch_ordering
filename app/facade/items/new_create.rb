# frozen_string_literal: true

module Items
  class NewCreate
    def initialize(params = {})
      @params = params
    end

    def item
      if params.empty?
        @item ||= Item.new
      else
        @item ||= Item.create(params)
      end
    end

    private

    attr_reader :params
  end
end
