require 'rails_helper'

feature 'User can edit his question', %q{
  In order to correct question
  I'd like to be able edit my question
} do
  
  given(:user) { create(:user) }
  given(:question) { create(:question, author: user) }
  given(:someone_question) { create(:question) }

  background { login(user) }

  scenario 'User edits his question' do
    visit question_path(question)
    click_on 'edit'

    fill_in 'Body', with: 'Edited question'

    click_on 'Update Question'
    
    expect(page).to have_content 'Your question has been successfully edited.'
    expect(page).to have_content 'Edited question'
  end

  scenario 'User tries edit someone else question' do
    visit question_path(someone_question)

    click_on 'edit'
    
    expect(page).to have_content 'You can edit just yours questions.'
  end
end
