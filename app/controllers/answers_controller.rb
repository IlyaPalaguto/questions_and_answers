class AnswersController < ApplicationController
  expose :answer, build: ->(answer_params) do
    answer = question.answers.build(answer_params)
    answer.author_id = current_user.id
    answer
  end
  expose :question

  before_action :authenticate_user!
  
  def create
    if answer.save
      redirect_to answer.question, notice: 'Your answer successfully created'
    else
      render 'questions/show'
    end
  end

  def destroy
    if current_user.answers.include?(answer)
      answer.delete
      flash[:notice] = 'Your answer has been successfully deleted.'
    else
      flash[:alert] = 'You can delete just yours answers.'
    end

    redirect_to question_path(answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :body)
  end
end
