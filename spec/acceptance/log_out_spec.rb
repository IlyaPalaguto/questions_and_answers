require 'rails_helper'

feature 'User can log out', %q{
  In order to end of the session
  I'd like to be able to log out
} do

  given(:user) { create(:user) }
  scenario 'Authenticated user logs out' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log in'
    click_on 'Log out'

    expect(page).to have_content 'Signed out successfully.'
  end
end
