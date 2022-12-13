require 'rails_helper'

feature 'User can create question', %q{
  In order get solution for task
  I'd like to be able ask a questuion
} do

  background do
    visit questions_path
    click_on 'Ask question'
  end

  scenario 'User create question' do
    fill_in 'Title', with: 'Title'
    fill_in 'Body', with: 'text text text'
    click_on 'Ask'

    expect(page).to have_content 'Your question successfully created.'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'text text text'
  end

  scenario 'User tries create question with errors' do
    click_on 'Ask'

    expect(page).to have_content "Title can't be blank"
  end
end
