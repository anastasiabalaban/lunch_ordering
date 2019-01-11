class MenuDecorator < ApplicationDecorator
  def human_created_at
    created_at.strftime('%d.%m.%Y')
  end
end
