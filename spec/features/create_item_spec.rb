# frozen_string_literal: true

require 'rails_helper'

feature 'Create item' do
  let(:admin)     { create(:user, :admin) }
  let(:name)      { Faker::Food.unique.ingredient }
  let(:meal_type) { Item.meal_types.values.sample }

  before do
    sign_in admin

    visit new_item_path
  end

  context 'when admin creates item with...' do
    context 'valid data' do
      scenario 'item is successfully created' do
        fill_in 'Name', with: name
        choose(meal_type)
        click_button 'Create Item'

        expect(page).to have_content(name)
      end
    end

    context 'invalid data' do
      context 'empty name' do
        let(:name) { '' }

        scenario 'item is not created' do
          fill_in 'Name', with: name
          choose(meal_type)
          click_button 'Create Item'

          expect(page).to have_content("Name can't be blank")
        end
      end

      context 'empty meal type' do
        scenario 'item is not created' do
          fill_in 'Name', with: name
          click_button 'Create Item'

          expect(page).to have_content("Meal type can't be blank")
        end
      end
    end
  end
end
