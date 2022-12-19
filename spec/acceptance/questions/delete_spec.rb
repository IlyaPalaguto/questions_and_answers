require 'rails_helper'

feature 'User can delete his question' do
  given(:user) { create(:user) }
  given(:question) { create(:question, author: user) }
  given(:someone_question) { create(:question) }

  background { login(user) }

  scenario 'User deletes his question' do
    visit question_path(question)
    click_on 'delete'

    expect(page).to have_content 'Your question has been successfully deleted.'
  end

  scenario 'User tries delete someone question' do
    visit question_path(someone_question)
    click_on 'delete'

    expect(page).to have_content 'You can delete just yours question'
  end
end
