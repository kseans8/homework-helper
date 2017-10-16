class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @question.description ||= "No description provided for this question."
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      flash[:notice] = @question.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
