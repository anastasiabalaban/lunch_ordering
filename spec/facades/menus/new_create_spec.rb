# frozen_string_literal: true

require 'rails_helper'

describe Menus::NewCreate do
  describe '#menu' do
    subject { described_class.new(params).menu }

    context 'when params are not empty' do
      let(:params) { attributes_for(:menu) }

      it 'creates menu' do
        expect { subject }.to change { Menu.count }.by(1)
      end
    end

    context 'when params are empty' do
      let(:params) { {} }

      it 'does not create menu' do
        expect { subject }.not_to change { Menu.count }
      end
    end
  end
end
