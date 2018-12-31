class ItemsOrder < ApplicationRecord
  belongs_to :item
  belongs_to :order

  accepts_nested_attributes_for :item
end
