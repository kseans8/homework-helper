require 'rails_helper'

feature "index page is working" do
  scenario "see two questions (title only) in order, most recently posted question first" do
    question_one = Question.create(title: "What is the meaning of life?", description: "Please don't tell me it's 42")
    question_two = Question.create(title: "Please hire me.", description: "If you're reading this part of my code, you're probably considering me for a position, and let me tell you... I'm worth it")

    visit questions_path
    expect(page).to have_selector("ul#orderedQuestionList li:nth-child(1)", text: question_two.title)
    expect(page).to have_selector("ul#orderedQuestionList li:nth-child(2)", text: question_one.title)
  end
end
