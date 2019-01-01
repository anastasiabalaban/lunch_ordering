class Menu < ApplicationRecord
  has_many :items_menus, inverse_of: :menu
  has_many :items, through: :items_menus

  accepts_nested_attributes_for :items
  accepts_nested_attributes_for :items_menus, reject_if: :all_blank, allow_destroy: true
end
