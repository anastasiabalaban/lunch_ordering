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

    scenario 'user go to page with menus' do
      expect(page).to have_content(menu.name)
      expect(page).to have_content(menu.human_created_at)
      expect(page).to have_link('Show >>')
      expect(page).not_to have_link('Add today menu')
    end
  end

  context 'when visitor is admin' do
    let!(:user) { create(:user, :admin) }

    context 'when menu for today does not exist' do
      scenario 'admin go to page with menus' do
        expect(page).to have_link('Add today menu')
      end
    end

    context 'when menu for today exists' do
      let!(:menu) { create(:menu, :today_menu) }

      scenario 'admin go to page with menus' do
        expect(page).not_to have_link('Add today menu')
      end
    end
  end
end
