# frozen_string_literal: true

require 'rails_helper'

describe Menus::Index do
  let(:admin) { create(:user, :admin) }

  subject { described_class.new(admin) }

  describe '#allowed_create?' do
    it { is_expected.to be_truthy }
  end
end
