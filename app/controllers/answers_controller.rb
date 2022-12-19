class AnswersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    answer(answer_params).author_id = current_user.id
    if answer.save
      redirect_to answer.question, notice: 'Your answer successfully created'
    else
      render 'questions/show'
    end
  end

  def destroy
    if current_user.author_of?(answer)
      answer.delete
      flash[:notice] = 'Your answer has been successfully deleted.'
    else
      flash[:alert] = 'You can delete just yours answers.'
    end

    redirect_to question_path(answer.question)
  end

  private

  def question
    @question ||= Question.find(params[:question_id])
  end
  helper_method :question

  def answer(attributes = {})
    @answer ||= params[:id] ? Answer.find(params[:id]) : question.answers.build(attributes)
  end
  helper_method :answer

  def answer_params
    params.require(:answer).permit(:title, :body)
  end
end
