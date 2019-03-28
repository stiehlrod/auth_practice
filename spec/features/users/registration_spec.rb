require 'rails_helper'
RSpec.describe 'as a visitor' do
  describe 'I can create an account' do
    it 'requires my name, email and password' do
      visit welcome_path
      click_on "Register"
      expect(current_path).to eq(new_user_path)

      fill_in "Full name", with: "James Wilson"
      fill_in :Email, with: "james@gmail.com"
      fill_in :Password, with: "just_james"
      click_on "Create Account"

      expect(current_path).to eq(welcome_path)
      # expect(page).to have_content("Welcome James Wilson!")
    end
  end
end
