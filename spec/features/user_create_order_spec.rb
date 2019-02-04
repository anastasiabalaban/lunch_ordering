# frozen_string_literal: true

require 'rails_helper'

feature 'User create order' do
  let(:user)       { create(:user) }
  let!(:menu)      { create(:menu, :today_menu, :with_meals) }
  let(:meals)      { menu.meals }
  let(:first_meal) { meals.first_meals.first.decorate }
  let(:main_meal)  { meals.main_meals.first.decorate }
  let(:drink)      { meals.drinks.first.decorate }

  before do
    sign_in user

    visit new_order_path
  end

  def choose_meal(meal)
    choose meal.meal_name_and_price

    click_on 'Create Order'
  end

  context 'user can order...' do
    scenario 'first meal' do
      choose_meal first_meal

      expect(page).to have_content(first_meal.meal_name_and_price)
    end

    scenario 'main meal' do
      choose_meal main_meal

      expect(page).to have_content(main_meal.meal_name_and_price)
    end

    scenario 'drink' do
      choose_meal drink

      expect(page).to have_content(drink.meal_name_and_price)
    end
  end
end
