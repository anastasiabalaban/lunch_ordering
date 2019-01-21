# frozen_string_literal: true

require 'rails_helper'

feature 'Create menu', js: true do
  let(:admin)     { create(:user, :admin) }
  let!(:item)     { create(:item) }
  let(:menu_name) { Faker::Lorem.unique.word }
  let(:price)     { Faker::Number.positive }

  before do
    sign_in admin

    visit new_menu_path
  end

  context 'when admin creates menu with...' do
    context 'existing item' do

      before do
        fill_in 'Name', with: menu_name

        click_link 'Add item'
        find('.menu_meals_item .select').find(:option, item.name).select_option
        fill_in 'Price', with: price

        click_button 'Create Menu'

        click_on 'Show >>'
      end

      scenario 'displays menu name' do
        expect(page).to have_content(menu_name)
      end

      scenario 'displays item name' do
        expect(page).to have_content(item.name)
      end
    end

    context 'new item' do
      let(:item_name) { Faker::Food.unique.ingredient }

      before do
        fill_in 'Name', with: menu_name

        click_link 'Add item'
        click_link 'create new item'
        fill_in 'Price', with: price
        find('.js-meal-fields').fill_in 'Name', with: item_name
        choose('drink')

        click_button 'Create Menu'

        click_on 'Show >>'
      end

      scenario 'displays menu name' do
        expect(page).to have_content(menu_name)
      end

      scenario 'displays item name' do
        expect(page).to have_content(item_name)
      end
    end

    context 'empty menu name' do
      let(:empty_name) { '' }

      scenario 'menu is not created' do
        fill_in 'Name', with: empty_name
        click_button 'Create Menu'

        expect(page).to have_content("Name can't be blank")
      end
    end
  end
end
