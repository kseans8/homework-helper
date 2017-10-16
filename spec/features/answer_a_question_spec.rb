require 'rails_helper'

feature "Answering a question" do
  scenario 'I go to a question, and answer it honestly' do
    question = Question.create(title: 'Is there anybody out there?')

    visit(question_path(question))

    fill_in('Answer', :with => "I'm here for you my dude.")
    click_button('Submit')

    expect(page).to have_content("I'm here for you my dude.")
  end
end
