# frozen_string_literal: true

require 'rails_helper'

describe Menus::NewCreate do
  describe '#menu' do
    context 'when params is not empty' do
      subject { described_class.new(params) }

      let(:params) { attributes_for(:menu) }

      it 'creates menu' do
        subject.menu
        expect(Menu.find_by(name: params[:name])).to be_present
      end
    end

    context 'when params is empty' do
      it 'does not create menu' do
        expect { subject.menu }.not_to change { Menu.count }
      end
    end
  end
end
