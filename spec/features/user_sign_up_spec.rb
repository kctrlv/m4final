require "rails_helper"

RSpec.feature "User Sign Up, Login, Logout", :type => :feature do
  scenario "Visitor visits root and is redirected to join page" do
    visit "/"
    expect(current_path).to eq("/join")
    expect(page).to have_content("Login or Sign Up")
    expect(page).to have_link("Login")
    expect(page).to have_link("Sign Up")
  end

  scenario "Visitor clicks Sign Up, fills out form and is taken to links index" do
    visit '/'
    click_link "Sign Up"
    fill_in "user_email", with: "joe@example.com"
    fill_in "user_password", with: "1234"
    fill_in "user_password_confirmation", with: "1234"
    click_button "Submit"
    expect(current_path).to eq(links_path)
  end

  scenario "Visitor cannot signup without email" do
    visit '/'
    click_link "Sign Up"
    fill_in "user_password", with: "1234"
    fill_in "user_password_confirmation", with: "1234"
    click_button "Submit"
    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Email can't be blank")
  end

  scenario "Visitor cannot signup already taken email" do
    User.create!(email: "nancy@james.com", password: '1234')
    visit '/'
    click_link "Sign Up"
    fill_in "user_email", with: "nancy@james.com"
    fill_in "user_password", with: "1234"
    fill_in "user_password_confirmation", with: "1234"
    click_button "Submit"
    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Email has already been taken")
  end

  scenario "Visitor cannot signup if password confirmation doesn't match" do
    visit '/'
    click_link "Sign Up"
    fill_in "user_email", with: "joe@example.com"
    fill_in "user_password", with: "1234"
    fill_in "user_password_confirmation", with: "4321"
    click_button "Submit"
    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "User can login" do
    User.create!(email: 'nancy@james.com', password: '1234')
    visit '/'
    click_link "Login"
    fill_in "email", with: "nancy@james.com"
    fill_in "password", with: "1234"
    click_button "Submit"
    expect(current_path).to eq(links_path)
  end
  #
  # scenario "User can logout" do
  #   User.create(email: 'joe@example.com', password: '1234')
  #   visit '/'
  #   click_link "Login"
  #   fill_in "Email", with: "joe@example.com"
  #   fill_in "Password", with: "1234"
  #   fill_in "Password confirmation", with: "1234"
  #   click_button "Login"
  #   click_link "Sign Out"
  #   expect(current_path).to eq("/join")
  # end
end
