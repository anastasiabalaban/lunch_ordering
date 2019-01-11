# frozen_string_literal: true

module Items
  class Destroy < ApplicationService
    initialize_with :item
    
    def call
      item.destroy if ::Items::AllowDestroy.call(item)
    end
  end
end
