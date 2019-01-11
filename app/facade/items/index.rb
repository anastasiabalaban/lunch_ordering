# frozen_string_literal: true

module Items
  class Index
    def items
      @items ||= Item.all
    end

    def allowed_delete?(item)
      ::Items::AllowDestroy.call(item)
    end
  end
end
