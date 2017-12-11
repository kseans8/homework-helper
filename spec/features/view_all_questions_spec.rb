require 'rails_helper'

feature "index page is working" do
  pending "see two questions (title only) in order, most recently posted question first" do
    question_one = Question.create(title: "Can I have a beer yet?")
    question_two = Question.create(title: "What is the meaning of life?", description: "Please don't tell me it's 42.")

    visit questions_path
    expect(page).to have_selector("div.question-list div:nth-child(1)", text: question_two.title) # child 1 to question 2 to prove that order is descending. ya bish?
    expect(page).to have_selector("div.question-list div:nth-child(2)", text: question_one.title)
    # Check Here
    # Capybara not locating react elements, must work on fix
  end
end
