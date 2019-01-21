# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :meals, inverse_of: :menu
  has_many :items, through: :meals

  accepts_nested_attributes_for :items
  accepts_nested_attributes_for :meals, reject_if: :all_blank,
                                        allow_destroy: true

  validates :name, presence: true, uniqueness: true

  def self.today_menu
    find_by(['DATE(created_at) = ?', Date.current])
  end
end
