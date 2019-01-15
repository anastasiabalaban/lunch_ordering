# frozen_string_literal: true

require 'rails_helper'

feature 'Admin see items' do
  let!(:admin) { create(:user, :admin) }
  let!(:item) { create(:item) }

  before do
    sign_in admin
    visit items_path
  end

  scenario 'admin browses items' do
    expect(page).to have_content(item.name)
    expect(page).to have_content(item.meal_type)
    expect(page).to have_link('Edit')
    expect(page).to have_link('Add item')
  end
end
