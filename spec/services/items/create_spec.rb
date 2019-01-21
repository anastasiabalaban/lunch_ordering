# frozen_string_literal: true

require 'rails_helper'

describe Items::Create do
  subject { described_class.call(params) }

  context 'when params are valiid' do
    let(:params) { attributes_for(:item) }

    it 'creates an item' do
      expect { subject }.to change { Item.count }.by(1)
    end
  end

  context 'when params are not valiid' do
    let(:params) { {} }

    it 'does not create an item' do
      expect { subject }.not_to change { Item.count }
    end
  end
end
