# frozen_string_literal: true

require 'rails_helper'

describe MealDecorator do
  let(:item) { create(:item, name: 'pizza') }
  let(:meal) { create(:meal, item: item, price: 100).decorate }

  describe '#meal_name_and_price' do
    it 'returns a string with name and price' do
      expect(meal.meal_name_and_price).to eq('pizza : $100')
    end
  end
end
