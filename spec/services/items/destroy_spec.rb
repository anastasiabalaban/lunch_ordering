# frozen_string_literal: true

require 'rails_helper'

describe Items::Destroy do
  subject { described_class.call(item: item) }

  let(:item) { create(:item) }

  context 'when items do not exist in orders' do
    it 'deletes an item' do
      subject

      expect(Item.find_by(id: item.id)).not_to be_present
    end
  end

  context 'when items exists in orders' do
    let(:meal)         { create(:meal, item: item) }
    let!(:meals_order) { create(:meals_order, meal: meal) }

    it 'does not delete an item' do
      subject

      expect(Item.find_by(id: item.id)).to be_present
    end
  end
end
