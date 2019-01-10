# frozen_string_literal: true

module Items
  class Destroy
    extend SmartInit

    initialize_with :item
    is_callable

    def call
      item.destroy
    end
  end
end
