# frozen_string_literal: true

require 'rails_helper'

feature 'Guest signs up' do
  let(:name)         { Faker::Name.first_name }
  let(:email)        { Faker::Internet.email }
  let(:password)     { SecureRandom.base64(8) }
  let(:invalid_data) { '' }

  context 'when user sign up with valid name, email and password' do
    scenario 'successful sign up' do
      sign_up_with name, email, password

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end

  context 'when user sign up with invalid name' do
    scenario 'unsuccessful sign up' do
      sign_up_with invalid_data, email, password

      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'when user sign up with invalid email' do
    scenario 'unsuccessful sign up' do
      sign_up_with name, invalid_data, password

      expect(page).to have_content("Email can't be blank")
    end
  end

  context 'when user sign up with blank password' do
    scenario 'unsuccessful sign up' do
      sign_up_with name, email, invalid_data

      expect(page).to have_content("Password can't be blank")
    end
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
