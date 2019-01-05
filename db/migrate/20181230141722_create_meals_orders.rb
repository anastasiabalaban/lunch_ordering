class CreateMealsOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :meals_orders do |t|
      t.belongs_to :meal, index: true, foreign_key: true
      t.belongs_to :order, index: true, foreign_key: true
    end
  end
end
