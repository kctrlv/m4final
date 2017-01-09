require "rails_helper"

RSpec.describe "User creates links", :js => :true do
  before(:each) do
    create_bob
    login_as_bob
  end

  scenario "user creates a new link and sees it" do
    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_button "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end
  end

  scenario "user creates links, signs out, and sees their links when returning" do
    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_button "Add Link"

    fill_in "link-title", :with => "Google"
    fill_in "link-url", :with => "http://google.com"
    click_button "Add Link"
    click_link "Sign Out"

    login_as_bob
    within('#links-list') do
      expect(page).to have_content("Turing")
      expect(page).to have_content("Google")
    end
  end
end
