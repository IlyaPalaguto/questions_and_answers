class AnswersController < ApplicationController
  def create
    @answer = question.answers.build(answer_params)
    if @answer.save
      redirect_to @answer.question, notice: 'Your answer successfully created'
    else
      render 'questions/show'
    end
  end

  private

  def question
    @question ||= Question.find(params[:question_id])
  end

  helper_method :question

  def answer_params
    params.require(:answer).permit(:title, :body)
  end
end
