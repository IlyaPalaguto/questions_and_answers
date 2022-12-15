require 'rails_helper'

feature 'User can sign up', %q{
  In order to use app fully
  I'd like to be able to sign up
} do

  background { visit new_user_registration_path }

  scenario 'User signs up' do
    fill_in 'Email', with: 'example@mail.com'
    fill_in 'Password', with: '111111'
    fill_in 'Password confirmation', with: '111111'

    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'User tries sign up with errors' do
    fill_in 'Email', with: 'example@mail.com'
    fill_in 'Password', with: '111111'
    fill_in 'Password confirmation', with: '222222'

    click_on 'Sign up'

    expect(page).to have_content "Password confirmation doesn't match Password"
  end
end
