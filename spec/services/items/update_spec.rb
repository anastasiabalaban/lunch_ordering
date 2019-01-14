# frozen_string_literal: true

require 'rails_helper'

describe Items::Update do
  let(:item) { create(:item) }
  let(:new_params) { { id: item.id, name: 'New', meal_type: item.meal_type } }

  it 'updates an item' do
    described_class.call(item: item, params: new_params)
    expect(Item.find_by(id: item.id).name).to eq('New')
  end
end
