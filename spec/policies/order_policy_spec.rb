# frozen_string_literal: true

require 'rails_helper'

describe OrderPolicy do
  subject { described_class.new(user, menu) }

  let(:user) { create(:user) }

  context 'when today menu exists' do
    let(:menu) { create(:menu, :today_menu) }

    it { is_expected.to permit_new_and_create_actions }
  end

  context 'when today menu does not exist' do
    let(:menu) { create(:menu) }

    it { is_expected.to forbid_new_and_create_actions }
  end
end
