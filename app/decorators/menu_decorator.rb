# frozen_string_literal: true

class MenuDecorator < ApplicationDecorator
  def human_created_at
    created_at.strftime('%d.%m.%Y')
  end
end
