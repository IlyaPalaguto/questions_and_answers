require 'rails_helper'

feature 'Just authenticated user can create question', %q{
  In order get solution for task
  I'd like to be able ask a questuion
} do

  describe 'Authenticated user' do
    given(:user) { create(:user) }

    background do
      login(user)

      visit questions_path
      click_on 'Ask question'
    end

    scenario 'create question' do
      fill_in 'Title', with: 'Title'
      fill_in 'Body', with: 'text text text'
      click_on 'Ask'
  
      expect(page).to have_content 'Your question successfully created.'
      expect(page).to have_content 'Title'
      expect(page).to have_content 'text text text'
    end
  
    scenario 'tries create question with errors' do
      click_on 'Ask'
  
      expect(page).to have_content "Title can't be blank"
    end
  end

  scenario 'Unauthenticated user tries create question' do
    visit questions_path
    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
