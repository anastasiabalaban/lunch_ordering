# frozen_string_literal: true

require 'rails_helper'

feature 'Admin can see registered users' do
  let(:admin) { create(:user, :admin) }
  let!(:user) { create(:user) }

  before do
    sign_in admin

    visit users_path
  end

  context 'admin can see..' do
    scenario 'user name' do
      expect(page).to have_content(user.name)
    end

    scenario 'user email' do
      expect(page).to have_content(user.email)
    end
  end
end
