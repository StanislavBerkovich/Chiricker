require 'rails_helper'
describe User, '.search' do
  it "it do search" do
    search = "s"
    search_result = User.search(search)
    !(expect(search_result).to eq [])
  end
end