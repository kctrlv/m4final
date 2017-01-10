require "rails_helper"

RSpec.describe "Links API", :type => :request do
  it "creates a Link" do
    post "/api/v1/links", {url: "http://google.com", title: "Google"}
    created_link = JSON.parse(response.body)
    expect(created_link['title']).to eq("Google")
    expect(created_link['url']).to eq("http://google.com")
  end
end
