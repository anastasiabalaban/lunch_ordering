# frozen_string_literal: true

module Items
  class Destroy < ApplicationService
    def call
      item.destroy if ::Items::AllowDestroy.call(item)
    end
  end
end
