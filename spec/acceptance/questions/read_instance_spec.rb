require 'rails_helper'

feature 'User can read question', %q{
  In order get solution for my question
  I'd like to be able read answers for questions
} do

  given(:question) { create(:question) }
  given!(:answers)  { create_list(:answer, 3, question: question) }
  
  scenario 'User view question and answers for question' do

    visit question_path(question)

    expect(page).to have_content question.title
    expect(page).to have_content question.body

    answers.each do |answer|
      expect(page).to have_content answer.title
      expect(page).to have_content answer.body
    end
  end
end
