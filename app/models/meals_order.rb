# frozen_string_literal: true

class MealsOrder < ApplicationRecord
  belongs_to :meal
  belongs_to :order

  accepts_nested_attributes_for :meal
end
