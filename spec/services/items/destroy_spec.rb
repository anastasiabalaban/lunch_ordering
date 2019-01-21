# frozen_string_literal: true

require 'rails_helper'

describe Items::Destroy do
  subject { described_class.call(item: item) }

  let!(:item) { create(:item) }

  context 'when items do not exist in orders' do
    it 'deletes an item' do
      expect { subject }.to change { Item.count }.by(-1)
    end
  end

  context 'when items exists in orders' do
    let(:meal)         { create(:meal, item: item) }
    let!(:meals_order) { create(:meals_order, meal: meal) }

    it 'does not delete an item' do
      expect { subject }.not_to change { Item.count }
    end
  end
end
