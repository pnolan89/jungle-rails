require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      first_name: "Peter",
      last_name: "Nolan",
      email: "123@123",
      password: "12345678",
      password_confirmation: "12345678"
    )
  end

  scenario "They click on an add-to-cart button on the home page" do
    # ACT
    visit '/login'
    fill_in 'email', with: '123@123'
    fill_in 'password', with: '12345678'
    click_on 'Submit'

    # DEBUG / VERIFY
    sleep 2
    save_screenshot 'user_login.jpg'
    expect(page).to have_text @user.first_name
  end
end
