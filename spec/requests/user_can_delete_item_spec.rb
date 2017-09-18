require "rails_helper"

RSpec.describe "User can make POST request to items" do
  it "can create item" do
    item = create(:item)
    delete "/api/v1/items/#{item.id}"

    expect(response).to be_successful

    expect(Item.all).to eq([])
  end
end
