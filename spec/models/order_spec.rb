# frozen_string_literal: true

require 'rails_helper'

describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:meals).through(:meals_orders) }

    it { is_expected.to have_many(:first_meals).through(:meals_orders).source(:meal) }

    it { is_expected.to have_many(:main_meals).through(:meals_orders).source(:meal) }

    it { is_expected.to have_many(:drinks).through(:meals_orders).source(:meal) }
  end
end
