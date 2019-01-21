# frozen_string_literal: true

require 'rails_helper'

describe MenuDecorator do
  let(:menu) { create(:menu, created_at: 'Thu, 01 Jan 2019 09:22:45 UTC +00:00').decorate }

  describe '#human_created_at' do
    it 'returns date in correct format' do
      expect(menu.human_created_at).to eq('01.01.2019')
    end
  end
end
