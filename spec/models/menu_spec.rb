# frozen_string_literal: true

require 'rails_helper'

describe Menu, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:items).through(:meals) }
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for(:items) }

    it { is_expected.to accept_nested_attributes_for(:meals) }
  end
end
