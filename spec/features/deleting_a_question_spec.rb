require 'rails_helper'

feature 'Deleting a question' do
  scenario 'I realized that the question I asked was incredibly stupid and I dont want anybody to know that I had that thought' do
    visit questions_path
    click_link('Ask a question')

    fill_in('Question', :with => 'What is pie?')
    fill_in('Description', :with => "I see it in math all the time, but I don't understand what it is")

    click_button('Submit Question')
    click_link('Delete question')

    expect(page).to have_content('Questions')
    expect(page).to have_content('Ask a question')
  end
end
