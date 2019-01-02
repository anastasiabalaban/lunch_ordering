class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.belongs_to :item, index: true
      t.belongs_to :menu, index: true
      t.decimal :price
    end
  end
end
