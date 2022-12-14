require 'rails_helper'

feature 'User can create answer', %q{
  In order help to someone
  I'd like to be able write answers for a questuions
} do

  given(:question) { create(:question) }

  background do
    visit question_path(question)
  end

  scenario 'User create answer' do
    fill_in 'Title', with: 'Answer for question'
    fill_in 'Body', with: 'answer answer answer'
    click_on 'Send'

    expect(page).to have_content 'Your answer successfully created'
    expect(page).to have_content 'Answer for question'
    expect(page).to have_content 'answer answer answer'
  end

  scenario 'User tries create answer with errors' do
    click_on 'Send'

    expect(page).to have_content "Title can't be blank"
  end
end