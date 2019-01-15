# frozen_string_literal: true

require 'rails_helper'

feature 'Admin see registered users' do
  let!(:admin) { create(:user, :admin) }
  let!(:user) { create(:user) }

  before do
    sign_in admin
    visit users_path
  end

  scenario 'admin browses registered users' do
    expect(page).to have_content('All users')
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end
