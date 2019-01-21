# frozen_string_literal: true

require 'rails_helper'

feature 'Admin can see items' do
  let(:admin) { create(:user, :admin) }
  let!(:item) { create(:item) }

  before do
    sign_in admin

    visit items_path
  end

  context 'admin can see...' do
    scenario 'item name' do
      expect(page).to have_content(item.name)
    end

    scenario 'item meal type' do
      expect(page).to have_content(item.meal_type)
    end

    scenario 'edit link' do
      expect(page).to have_link('Edit')
    end

    scenario 'link to add item' do
      expect(page).to have_link('Add item')
    end
  end
end
