# frozen_string_literal: true

require 'rails_helper'

describe Menus::NewCreate do
  subject { described_class.new(params).menu }

  describe '#menu' do
    context 'when params is not empty' do
      let(:params) { attributes_for(:menu) }

      it 'creates menu' do
        subject

        expect(Menu.find_by(name: params[:name])).to be_present
      end
    end

    context 'when params is empty' do
      let(:params) { {} }

      it 'does not create menu' do
        expect { subject }.not_to change { Menu.count }
      end
    end
  end
end
