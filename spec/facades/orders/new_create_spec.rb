# frozen_string_literal: true

require 'rails_helper'

describe Orders::NewCreate do
  subject { described_class.new(user, params).order }

  let(:user) { create(:user) }

  describe '#order' do
    context 'when params is not empty' do
      let(:params) { attributes_for(:order) }

      it 'creates order' do
        expect { subject }.to change { Order.count }.by(1)
      end
    end

    context 'when params is empty' do
      let(:params) { {} }

      it 'does not create order' do
        expect { subject }.not_to change { Order.count }
      end
    end
  end
end
