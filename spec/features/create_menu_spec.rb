# frozen_string_literal: true

require 'rails_helper'

feature 'Create menu', js: true do
  let!(:admin) { create(:user, :admin) }
  let!(:item) { create(:item) }

  before do
    sign_in admin
    visit new_menu_path
  end

  context 'when admin creates menu with existing item' do
    scenario 'menu is successfully created' do
      fill_in 'Name', with: 'Today menu'

      click_link 'Add item'
      find('.menu_meals_item .select').find(:option, item.name).select_option
      fill_in 'Price', with: 100

      click_button 'Create Menu'

      menu = Menu.find_by(name: 'Today menu')
      expect(menu).to be_present
      expect(menu.items).to include(item)
    end
  end

  context 'when admin creates menu with new item' do
    scenario 'menu and item is successfully created' do
      fill_in 'Name', with: 'Menu name'

      click_link 'Add item'
      click_link 'create new item'
      fill_in 'Price', with: 100
      find('.js-meal-fields').fill_in 'Name', with: 'Item name'
      choose('drink')

      click_button 'Create Menu'

      menu = Menu.find_by(name: 'Menu name')
      new_item = Item.find_by(name: 'Item name')
      expect(menu).to be_present
      expect(new_item).to be_present
      expect(menu.items).to include(new_item)
    end
  end
end
