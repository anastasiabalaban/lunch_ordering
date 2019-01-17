# frozen_string_literal: true

require 'rails_helper'

feature 'Create item' do
  let!(:admin) { create(:user, :admin) }

  before do
    sign_in admin
    visit new_item_path
  end

  context 'when admin creates item with valid data' do
    scenario 'item is successfully created' do
      expect(page).to have_content('Add new item to menu')

      fill_in 'Name', with: 'Tea'
      choose('drink')
      click_button 'Create Item'

      expect(Item.find_by(name: 'Tea')).to be_present
    end
  end

  context 'when admin creates item with empty name' do
    scenario 'item is not created' do
      fill_in 'Name', with: ''
      choose('drink')
      click_button 'Create Item'

      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'when admin creates item with empty meal type' do
    scenario 'item is not created' do
      fill_in 'Name', with: 'Tea'
      click_button 'Create Item'

      expect(page).to have_content("Meal type can't be blank")
    end
  end
end
