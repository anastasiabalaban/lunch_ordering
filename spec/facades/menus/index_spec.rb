# frozen_string_literal: true

require 'rails_helper'

describe Menus::Index do
  describe '#allowed_create?' do
    subject { described_class.new(user).allowed_create? }

    context 'when user is an admin' do
      let(:user) { create(:user, :admin) }

      it 'returns true' do
        is_expected.to be_truthy
      end
    end

    context 'when user is not an admin' do
      let(:user) { create(:user) }

      it 'returns false' do
        is_expected.to be_falsy
      end
    end
  end
end
