# frozen_string_literal: true

require 'rails_helper'

describe Menus::Show do
  describe '#total_order_cost' do
    subject { described_class.new(menu).total_order_cost }

    let(:menu) { create(:menu, :with_meals) }

    context 'when orders exist' do
      let(:order_1) { create(:order) }
      let(:order_2) { create(:order) }
      let(:meals)   { menu.meals }
      let(:meal_1)  { meals.first }
      let(:meal_2)  { meals.last }
      let(:price)   { meal_1.price + meal_2.price }

      before do
        order_1.meals << meal_1
        order_2.meals << meal_2
      end

      it 'returns total orders cost' do
        is_expected.to eq(price)
      end
    end

    context 'when orders do not exist' do
      it 'returns zero' do
        is_expected.to be_zero
      end
    end
  end
end
