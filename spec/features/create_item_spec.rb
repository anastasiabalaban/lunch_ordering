# frozen_string_literal: true

require 'rails_helper'

feature 'Create item' do
  let!(:admin) { create(:user, :admin) }

  before do
    sign_in admin
    visit new_item_path
  end

  scenario 'admin creates item' do
    expect(page).to have_content('Add new item to menu')

    fill_in 'Name', with: 'Tea'
    choose('drink')
    click_button 'Create Item'

    expect(Item.find_by(name: 'Tea')).to be_present
  end
end
