require 'rails_helper'
RSpec.describe 'as a visitor' do
  before :each do
    @user = User.create(full_name:"James Wilson", email:"james@gmail.com", password:"just_james")
  end
  describe 'i can login' do
    it 'and see my name' do
      visit welcome_path
      click_on "Login"
      expect(current_path).to eq(login_path)
      fill_in :email, with: "james@gmail.com"
      fill_in :password, with: "just_james"
      click_on "Log me in"
      expect(current_path).to eq(user_path(@user))
      expect(page).to have_content("Welcome James Wilson!")
    end
  end
  describe 'i can logout' do
    it 'destroys my session' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit user_path(@user)
      click_on "Logout"
      expect(current_path).to eq(welcome_path)
      expect(page).to have_content("Welcome!")
    end
  end
end
