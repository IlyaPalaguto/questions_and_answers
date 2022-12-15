require 'rails_helper'

feature 'Just authenticated user can create answer', %q{
  In order help to someone
  I'd like to be able write answers for a questuions
} do

  given(:user) { create(:user) }
  given(:question) { create(:question) }

  describe 'Authenticated user' do
    background do
      login(user)
      visit question_path(question)
    end
  
    scenario 'create answer' do
      fill_in 'Title', with: 'Answer for question'
      fill_in 'Body', with: 'answer answer answer'
      click_on 'Send'
  
      expect(page).to have_content 'Your answer successfully created'
      expect(page).to have_content 'Answer for question'
      expect(page).to have_content 'answer answer answer'
    end
  
    scenario 'tries create answer with errors' do
      click_on 'Send'
  
      expect(page).to have_content "Title can't be blank"
    end
  end

  scenario 'Unauthenticated user tries create answer' do
    visit question_path(question)

    fill_in 'Title', with: 'Answer for question'
    fill_in 'Body', with: 'answer answer answer'
    click_on 'Send'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end