require "rails_helper"

RSpec.describe "can create links", :js => :true do
  scenario "Create a new link" do
    User.create!(email: "bob@bob.com", password: "1234")
    visit "/login"
    fill_in "email", with: "bob@bob.com"
    fill_in "password", with: "1234"
    click_on "Submit"
    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_button "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end

  end
end
