class CreateItemsMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :items_menus do |t|
      t.belongs_to :item, index: true
      t.belongs_to :menu, index: true
    end
  end
end
