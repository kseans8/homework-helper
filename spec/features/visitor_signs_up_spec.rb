require 'rails_helper'

feature "signing up is easy, yo." do
  scenario "I like the website, so I decided to sign up. happy path" do
    visit questions_path
    click_button("Sign Up")
    expect(page).to have_content("Sign up")

    fill_in("Username", :with => "JonSnow")
    fill_in("Email", :with => "jon.snow@winterfell.gov")
    fill_in("Password", :with => "1L0veygritte")
    fill_in("Password confirmation", :with => "1L0veygritte")

    click_button("Sign up")

    expect(page).to_not have_current_path("/questions")
    expect(page).to have_current_path("/")
  end
  scenario "I like the website, so I decided to sign up. unhappy path" do
    visit questions_path
    click_button("Sign Up")
    expect(page).to have_content("Sign up")

    fill_in("Username", :with => "JonSnow")
    fill_in("Password", :with => "1L0veygritte")
    fill_in("Password confirmation", :with => "1L0veygritte")

    click_button("Sign up")

    expect(page).to_not have_current_path("/")

    expect(page).to have_content("Email can't be blank")
  end
end
