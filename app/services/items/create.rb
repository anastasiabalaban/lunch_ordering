# frozen_string_literal: true

module Items
  class Create < ApplicationService
    attr_reader :params

    def initialize(params = {})
      @params = params
    end

    def call
      return @item ||= Item.new if params.empty?
      @item ||= Item.create(params)
    end
  end
end
