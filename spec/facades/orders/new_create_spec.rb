# frozen_string_literal: true

require 'rails_helper'

describe Orders::NewCreate do
  describe '#order' do
    context 'when params is not empty' do
      let(:user) { create(:user) }
      let(:params) { attributes_for(:order) }

      subject { described_class.new(user, params) }

      it 'creates order' do
        expect { subject.order }.to change { Order.count }.by(1)
      end
    end

    context 'when params is empty' do
      it 'does not create order' do
        expect { subject.order }.not_to change { Order.count }
      end
    end
  end
end
