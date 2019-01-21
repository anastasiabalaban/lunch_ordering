# frozen_string_literal: true

require 'rails_helper'

feature 'See menu items' do
  let(:user)       { create(:user) }
  let!(:menu)      { create(:menu, :with_meals).decorate }
  let(:menu_items) { menu.items }
  let(:first_meal) { menu_items.first_meal.first }
  let(:main_meal)  { menu_items.main_meal.first }
  let(:drink)      { menu_items.drink.first }

  before do
    sign_in user

    visit menu_path(menu)
  end

  context 'user can see...' do
    scenario 'menu name' do
      expect(page).to have_content(menu.name)
    end

    scenario 'first meal' do
      expect(page).to have_content(first_meal.name)
    end

    scenario 'main meal' do
      expect(page).to have_content(main_meal.name)
    end

    scenario 'drink' do
      expect(page).to have_content(drink.name)
    end
  end
end
