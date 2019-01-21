# frozen_string_literal: true

require 'rails_helper'

describe Meal, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:price) }

    it { is_expected.to validate_numericality_of(:price).is_greater_than(Meal::MIN_PRICE) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:orders).through(:meals_orders) }

    it { is_expected.to belong_to(:item) }

    it { is_expected.to belong_to(:menu) }
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for(:item) }
  end
end
