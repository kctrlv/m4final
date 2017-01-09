require "rails_helper"

RSpec.describe "User creates links", :js => :true do
  before(:each) do
    create_bob
    login_as_bob
  end

  scenario "user creates a new link and goes to edit it" do
    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_button "Add Link"
    click_button "Edit"
    expect(page).to have_content("Edit Link")
  end

end
