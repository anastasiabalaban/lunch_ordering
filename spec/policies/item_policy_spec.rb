# frozen_string_literal: true

require 'rails_helper'

describe ItemPolicy do
  let(:item) { create(:item) }

  subject { described_class.new(user, item) }

  context 'being an admin' do
    let(:user) { create(:user, :admin) }

    it { is_expected.to permit_actions(%i[index new create edit update destroy]) }

    context 'when items exists in orders' do
      let(:meal) { create(:meal, item: item) }
      let!(:meals_order) { create(:meals_order, meal: meal) }

      it { is_expected.to forbid_action(:destroy) }
    end
  end

  context 'being an user' do
    let(:user) { create(:user) }

    it { is_expected.to forbid_actions(%i[index new create edit update destroy]) }
  end
end
