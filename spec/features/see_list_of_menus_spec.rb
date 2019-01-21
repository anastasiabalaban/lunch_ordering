# frozen_string_literal: true

require 'rails_helper'

feature 'See list of menus' do
  let!(:menu) { create(:menu).decorate }

  before do
    sign_in user

    visit root_path
  end

  context 'when visitor is user' do
    let!(:user) { create(:user) }

    context 'user can see...' do
      scenario 'manu name' do
        expect(page).to have_content(menu.name)
      end

      scenario 'manu date' do
        expect(page).to have_content(menu.human_created_at)
      end

      scenario 'link to show menu' do
        expect(page).to have_link('Show >>')
      end
    end
  end

  context 'when visitor is admin' do
    let(:user) { create(:user, :admin) }

    context 'admin can see...' do
      scenario 'manu name' do
        expect(page).to have_content(menu.name)
      end

      scenario 'manu date' do
        expect(page).to have_content(menu.human_created_at)
      end

      scenario 'link to show menu' do
        expect(page).to have_link('Show >>')
      end
    end

    context 'when menu for today does not exist' do
      scenario 'admin can see link for menu creation' do
        expect(page).to have_link('Add today menu')
      end
    end

    context 'when menu for today exists' do
      let!(:menu) { create(:menu, :today_menu) }

      scenario 'admin can not see link for menu creations' do
        expect(page).not_to have_link('Add today menu')
      end
    end
  end
end
