# frozen_string_literal: true

require 'rails_helper'

feature 'Admin can see menu and user orders there' do
  let(:admin) { create(:user, :admin) }

  before do
    sign_in admin

    visit menu_path(menu)
  end

  context 'when orders exist' do
    let!(:order)     { create(:order, :with_meals).decorate }
    let(:meal)       { order.meals.first }
    let(:menu)       { meal.menu }
    let(:total_cost) { Menus::Show.new(menu).total_order_cost }

    scenario 'admin can see total orders cost' do
      expect(page).to have_content(total_cost)
    end

    context "admin can see order's ..." do
      scenario 'user name' do
        expect(page).to have_content(order.user_name)
      end

      scenario 'meal name' do
        expect(page).to have_content(meal.item_name)
      end

      scenario 'total cost' do
        expect(page).to have_content(order.total_cost)
      end
    end
  end

  context 'when orders do not exist' do
    let(:menu) { create(:menu) }

    scenario 'total orders cost equals zero' do
      expect(page).to have_content(0)
    end
  end
end
