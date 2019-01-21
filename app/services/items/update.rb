# frozen_string_literal: true

module Items
  class Update < ApplicationService
    initialize_with :item, :params

    def call
      item.update(params)
    end
  end
end
