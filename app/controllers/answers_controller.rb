class AnswersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @answer = question.answers.build(answer_params)
    @answer.author_id = current_user.id
    if @answer.save
      redirect_to @answer.question, notice: 'Your answer successfully created'
    else
      render 'questions/show'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    
    if current_user.answers.include?(@answer)
      @answer.delete
      flash[:notice] = 'Your answer has been successfully deleted.'
    else
      flash[:alert] = 'You can delete just yours answers.'
    end

    redirect_to question_path(@answer.question)
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
