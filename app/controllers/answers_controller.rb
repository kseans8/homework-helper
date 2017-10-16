class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answer = @question.answer
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question
    if @answer.save
      redirect_to @question
    else
      flash[:notice] = @answer.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
