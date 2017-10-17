require 'rails_helper'

feature "navigation to show page is working" do
  scenario "open a question and see what's inside! (hint, it's a breif description)" do
    question_one = Question.create(title: "Can I have a beer yet?")
    question_two = Question.create(title: "Please hire me.", description: "If you're reading this part of my code, you're probably considering me for a position, and let me tell you... I'm worth it.")


    visit questions_path
    click_link('Can I have a beer yet?')
    expect(page).to have_content("No description provided for this question.")

    click_link('Back to questions')
    expect(page).to have_content('Can I have a beer yet?')

    click_link('Please hire me.')
    expect(page).to have_content("If you're reading this part of my code, you're probably considering me for a position, and let me tell you... I'm worth it.")
  end
end
