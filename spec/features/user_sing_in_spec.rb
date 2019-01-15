# frozen_string_literal: true

require 'rails_helper'

feature 'User signs in' do
  context 'when user was registered' do
    let(:user) { create(:user) }

    scenario 'signing in with correct email and password' do
      sign_in user

      expect(page).to have_content('Signed in successfully.')
    end
  end

  context 'when user was not registered' do
    let(:invalid_user) { build(:user) }

    scenario 'signing in with invalid email and password' do
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
