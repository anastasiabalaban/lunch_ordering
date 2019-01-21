# frozen_string_literal: true

require 'rails_helper'

describe MenuPolicy do
  subject { described_class.new(user, menu) }

  let(:menu) { create(:menu) }

  context 'being an admin' do
    let(:user) { create(:user, :admin) }

    it { is_expected.to permit_actions(%i[index show new create]) }

    context 'when today menu exists' do
      let(:menu) { create(:menu, :today_menu) }

      it { is_expected.to forbid_new_and_create_actions }
    end
  end

  context 'being an user' do
    let(:user) { create(:user) }

    it { is_expected.to permit_actions(%i[index show]) }
  end
end
