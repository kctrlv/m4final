require "rails_helper"

RSpec.feature "User Sign Up, Login, Logout", :type => :feature do
  scenario "Visitor visits root and is redirected to join page" do
    visit "/"
    expect(current_path).to eq("/join")
    expect(page).to have_content("Login or Sign Up")
    expect(page).to have_link("Login")
    expect(page).to have_link("Sign Up")
  end
end
