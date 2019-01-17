# frozen_string_literal: true

require 'rails_helper'

describe Menus::Index do
  subject { described_class.new(admin).allowed_create? }

  let(:admin) { create(:user, :admin) }

  describe '#allowed_create?' do
    it { is_expected.to be_truthy }
  end
end
