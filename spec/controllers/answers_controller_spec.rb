require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question) }
  
  describe 'GET #new' do
    before { get :new, params: { question_id: question } }

    it 'assigns a new answer with current question_id to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer) && have_attributes(question_id: question.id)
    end

    it 'renders new views' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new answer in the database' do
        expect { post :create, params: { question_id: question, answer: attributes_for(:answer) } }.to change(Answer, :count).by(1)
      end

      it 'redirect to show view' do
        post :create, params: { question_id: question, answer: attributes_for(:answer) }
        expect(response).to redirect_to(assigns(:answer))
      end
    end

    context 'with invalid attributes' do
      it 'does not save answer in the database' do
        expect { post :create, params: { question_id: question, answer: attributes_for(:answer, :invalid) } }.to_not change(Answer, :count)
      end

      it 're-render new view' do
        post :create, params: { question_id: question, answer: attributes_for(:answer, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
