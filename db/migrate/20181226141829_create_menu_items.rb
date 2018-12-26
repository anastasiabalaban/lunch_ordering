class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.references :item, index: true
      t.timestamps
    end
  end
end
