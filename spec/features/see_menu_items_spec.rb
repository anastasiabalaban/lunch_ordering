# frozen_string_literal: true

require 'rails_helper'

feature 'See menu items' do
  let!(:user) { create(:user) }
  let!(:menu) { create(:menu).decorate }

  before do
    sign_in user
    visit menu_path(menu)
  end

  scenario 'user can see menu meals' do
    expect(page).to have_content(menu.name)
    expect(page).to have_content('First meals:')
    expect(page).to have_content('Main meals:')
    expect(page).to have_content('Drinks:')
  end
end
