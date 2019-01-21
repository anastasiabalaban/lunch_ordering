# frozen_string_literal: true

require 'rails_helper'

describe Item, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_uniqueness_of(:name) }

    it { is_expected.to validate_presence_of(:meal_type) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:menus).through(:meals) }
  end
end
