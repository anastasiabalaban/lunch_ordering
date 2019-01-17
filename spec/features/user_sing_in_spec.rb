# frozen_string_literal: true

require 'rails_helper'

feature 'User signs in' do
  context 'when user was registered and sign in with correct email and password' do
    let(:user) { create(:user) }

    scenario 'user sign in successfully' do
      sign_in user

      expect(page).to have_content('Signed in successfully.')
    end
  end

  context 'when user was not registered or sign in with invalid data' do
    let(:invalid_user) { build(:user) }

    scenario 'user see warning flesh message' do
      sign_in invalid_user

      expect(page).to have_content('Invalid Email or password.')
    end
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end
