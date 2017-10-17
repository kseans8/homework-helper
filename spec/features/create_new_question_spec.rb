require 'rails_helper'

feature 'Filling out new question form' do
  scenario "Happy path => I fill out everything properly and nothing breaks!" do
    visit questions_path
    expect(page).to have_link('Ask a question')

    click_link('Ask a question')
    expect(page).to have_field('Title')
    expect(page).to have_field('Description')

    fill_in('Title', :with => 'How do I learn Dvorak?')
    fill_in('Description', :with => 'I need to up my wpm.')

    click_button('Submit Question')

    expect(page).to have_content('How do I learn Dvorak?')
    expect(page).to have_content('I need to up my wpm.')
  end

  scenario "Sad path => I do not enter a title" do
    visit questions_path
    expect(page).to have_link('Ask a question')

    click_link('Ask a question')
    expect(page).to have_field('Title')
    expect(page).to have_field('Description')

    click_button('Submit Question')

    expect(page).to have_content("Title can't be blank")
  end
end
