class ItemsMenu < ApplicationRecord
  belongs_to :item
  belongs_to :menu

  accepts_nested_attributes_for :item, reject_if: :all_blank
end
