# frozen_string_literal: true

module Items
  class Create < ApplicationService
    attr_reader :params

    def initialize(params = {})
      @params = params
    end

    def call
      @item ||= params.empty? ? Item.new : Item.find_or_create_by(params)
    end
  end
end
