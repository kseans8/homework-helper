class Api::V1::QuestionsController < ApplicationController
  def index
    questions = Question.all.order(created_at: :desc)
    answers = Answer.all.order(created_at: :desc)
    render json: {questions: questions, answers: answers}
  end

  def show
    question = Question.find(params[:id])
    answers = question.answers
    users = User.all
    render json: {question: question, answers: answers, users: users}
  end
end
