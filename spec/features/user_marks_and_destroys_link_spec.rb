require "rails_helper"

RSpec.describe "User marks links as read", :js => :true do
  before(:each) do
    create_bob
    login_as_bob
  end

  scenario "user marks a link as read" do
    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_button "Add Link"
    click_button "Mark as Read"
    expect(page).to have_content("Edit Link")
  end

end