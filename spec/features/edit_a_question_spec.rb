require 'rails_helper'

feature "editing a question" do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  pending 'I make a question, then decide I need to edit it properly' do
    visit questions_path
    click_button('Ask a question')

    fill_in('Question', :with => 'What is pie?')
    fill_in('Description', :with => "I see it in math all the time, but I don't understand what it is")

    click_button('Submit Question')
    click_button('Edit question')

    fill_in('Question', :with => 'What is pi?')
    click_button('Submit Question')
    expect(page).to have_content('What is pi?')
    # Check Here
    # Capybara not locating react elements, must work on fix
  end
  scenario "I make a question, then I decide to edit it to the point that it's not acceptable" do
    visit questions_path
    click_button('Ask a question')

    fill_in('Question', :with => 'What is pie?')
    fill_in('Description', :with => "I see it in math all the time, but I don't understand what it is")

    click_button('Submit Question')
    click_button('Edit question')

    fill_in('Question', :with => '')
    click_button('Submit Question')
    expect(page).to have_content("Title can't be blank")
  end
end
