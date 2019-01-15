# frozen_string_literal: true

require 'rails_helper'

feature 'Guest signs up' do
  scenario 'signing up with valid name, email and password' do
    sign_up_with 'Name', 'valid@example.com', 'password'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('logged in as valid@example.com')
    expect(page).to have_content('Log out')
  end

  scenario 'signing up with invalid name' do
    sign_up_with '', 'invalid_email', 'password'

    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Log in')
  end

  scenario 'signing up with invalid email' do
    sign_up_with 'Name', 'invalid_email', 'password'

    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Log in')
  end

  scenario 'signing up with blank password' do
    sign_up_with 'Name', 'valid@example.com', ''

    expect(page).to have_content('Password can\'t be blank')
    expect(page).to have_content('Log in')
  end

  def sign_up_with(name, email, password)
    visit new_user_registration_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end
end
