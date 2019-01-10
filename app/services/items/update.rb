# frozen_string_literal: true

module Items
  class Update
    extend SmartInit

    initialize_with :item, :params
    is_callable

    def call
      item.update(params)
    end
  end
end
