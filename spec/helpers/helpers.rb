def create_bob
  User.create!(email: "bob@bob.com", password: "1234")
end

def login_as_bob
  visit "/login"
  fill_in "email", with: "bob@bob.com"
  fill_in "password", with: "1234"
  click_on "Submit"
end
