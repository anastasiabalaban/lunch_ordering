# frozen_string_literal: true

require 'rails_helper'

describe Items::Update do
  subject { described_class.call(item: item, params: params) }

  let(:item)   { create(:item, meal_type: Item::FIRST_MEAL) }
  let(:params) { { id: item.id, name: new_name, meal_type: new_meal_type } }

  context 'when params are valid' do
    let(:new_name)      { Faker::Food.unique.ingredient }
    let(:new_meal_type) { Item::DRINK }

    it 'updates item name' do
      expect { subject }.to change(item, :name).to(new_name)
    end

    it 'updates item meal type' do
      expect { subject }.to change(item, :meal_type).to(new_meal_type)
    end
  end

  context 'when params are not valid' do
    let(:new_name)      { '' }
    let(:new_meal_type) { '' }

    it 'does not update item name' do
      expect { subject; item.reload }.not_to change(item, :name)
    end

    it 'does not update item meal_type' do
      expect { subject; item.reload }.not_to change(item, :meal_type)
    end

    it 'returns false' do
      is_expected.to be_falsy
    end
  end
end
