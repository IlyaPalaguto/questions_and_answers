require 'rails_helper'

feature 'User can delete his answers' do
  
  given(:user) { create(:user) }
  given(:answer) { create(:answer, author: user) }
  given(:someone_answer) { create(:answer) }

  background { login(user) }

  scenario 'User deletes his answer' do
    visit question_path(answer.question)
    click_on 'delete answer'
    
    expect(page).to have_content 'Your answer has been successfully deleted.'
  end

  scenario 'User tries delete someone else answer' do
    visit question_path(someone_answer.question)
    click_on 'delete answer'

    expect(page).to have_content 'You can delete just yours answers.'
  end
end
