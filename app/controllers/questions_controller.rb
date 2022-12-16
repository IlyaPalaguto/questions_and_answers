class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_question, only: %i[show edit update destroy]

  def new
    @question = current_user.questions.build
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:notice] = 'Your question successfully created.'
      redirect_to @question
    else
      render :new
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @answer = @question.answers.build
  end

  def edit
    unless current_user.questions.include?(@question)
      redirect_to question_path(@question), alert: 'You can edit just yours questions.'
    end
  end
  
  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: 'Your question has been successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    if current_user.questions.include?(@question)
      @question.delete
      redirect_to questions_path, notice: 'Your question has been successfully deleted.'
    else
      redirect_to question_path(@question), alert: 'You can delete just yours question.'
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
