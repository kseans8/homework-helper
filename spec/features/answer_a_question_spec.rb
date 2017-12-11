require 'rails_helper'

feature "Answering a question" do
  pending 'I go to a question, and answer it honestly' do
    question = Question.create(title: 'Is there anybody out there?')

    visit(question_path(question))

    fill_in('Answer', :with => "I'm here for you my dude.")
    click_button('Submit Answer')

    expect(page).to have_content("I'm here for you my dude.")
    # Check Here
    # Capybara not locating react elements, must work on fix
  end
  scenario 'I go to a question, and I try to be a jerk and submit a blank string' do
    question = Question.create(title: 'Can you not be a jerk?')

    visit(question_path(question))

    click_button('Submit Answer')

    expect(page).to have_content("Answer can't be blank")
  end
end
