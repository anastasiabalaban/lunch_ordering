# frozen_string_literal: true

require 'rails_helper'

describe Items::Create do
  let(:params) { attributes_for(:item) }

  it 'creates an item' do
    described_class.call(params)
    expect(Item.find_by(name: params[:name])).to be_present
    # expect { create_item }.to change(Item, :count).by(1)
  end
end
