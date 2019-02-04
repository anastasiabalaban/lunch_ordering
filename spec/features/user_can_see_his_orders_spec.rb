# frozen_string_literal: true

require 'rails_helper'

feature 'User can see his orders' do
  let(:user)   { create(:user) }
  let!(:order) { create(:order, :with_meals, user: user).decorate }
  let(:meals)  { order.meals }
  let(:meal)   { meals.first }

  before do
    sign_in user

    visit orders_path
  end

  context "user can see order's..." do
    scenario "meal's name and price" do
      expect(page).to have_content(meal.meal_name_and_price)
    end

    scenario "order's date" do
      expect(page).to have_content(order.human_created_at)
    end

    scenario "order's total cost" do
      expect(page).to have_content(order.total_cost)
    end
  end
end
