require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of :url }
  it { should validate_presence_of :title }

  it 'checks url validity' do
    link = Link.new(title: "invalid", url: "bla")
    link.save
    expect(link.errors.messages[:url]).to eq(["is not a valid URL"])
  end
end
