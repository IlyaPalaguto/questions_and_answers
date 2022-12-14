require 'rails_helper'

feature 'User can view questions', %q{
  In order search solution for task
  I'd like to be able view questions
} do

  given!(:questions) { create_list(:question, 3) }

  scenario 'User view questions' do
    visit questions_path
    questions.each do |question|
      expect(page).to have_content question.title
    end
  end
end