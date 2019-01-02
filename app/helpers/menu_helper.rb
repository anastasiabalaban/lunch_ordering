module MenuHelper
  def menu_items(items)
    items.each do |item|
      concat content_tag(:p, "#{item.name} : #{item.price}")
    end
  end
end
