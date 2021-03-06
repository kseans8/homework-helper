require 'rails_helper'

feature 'Filling out new question form' do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  pending "Happy path => I fill out everything properly and nothing breaks!" do
    visit questions_path
    expect(page).to have_button('Ask a question')

    click_button('Ask a question')
    expect(page).to have_field('Question')
    expect(page).to have_field('Description')

    fill_in('Question', :with => 'How do I learn Dvorak?')
    fill_in('Description', :with => 'I need to up my wpm.')

    click_button('Submit Question')

    expect(page).to have_content('How do I learn Dvorak?')
    expect(page).to have_content('I need to up my wpm.')
    # Check Here
    # Capybara not locating react elements, must work on fix
  end

  scenario "Sad path => I do not enter a title" do
    visit questions_path
    expect(page).to have_button('Ask a question')

    click_button('Ask a question')
    expect(page).to have_field('Question')
    expect(page).to have_field('Description')

    click_button('Submit Question')

    expect(page).to have_content("Title can't be blank")
  end
end
