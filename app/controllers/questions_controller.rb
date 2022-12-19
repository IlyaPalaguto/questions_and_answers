class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def create
    if question(question_params).save
      flash[:notice] = 'Your question successfully created.'
      redirect_to question
    else
      render :new
    end
  end

  def edit
    unless current_user.questions.include?(question)
      redirect_to question_path(question), alert: 'You can edit just yours questions.'
    end
  end
  
  def update
    if question.update(question_params)
      redirect_to question_path(question), notice: 'Your question has been successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    if current_user.questions.include?(question)
      question.delete
      redirect_to questions_path, notice: 'Your question has been successfully deleted.'
    else
      redirect_to question_path(question), alert: 'You can delete just yours question.'
    end
  end

  private

  def question(attributes = {})
    @question ||= params[:id] ? Question.find(params[:id]) : current_user.questions.new(attributes)
  end
  helper_method :question

  def questions
    @questions = Question.all
  end
  helper_method :questions

  def answer
    @answer ||= question.answers.build
  end
  helper_method :answer

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
