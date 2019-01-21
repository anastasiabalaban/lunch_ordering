# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_most(User::MAX_NAME) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:orders) }
  end
end
