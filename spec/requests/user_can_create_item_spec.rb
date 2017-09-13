require 'rails_helper'

RSpec.describe "As a user I can make an POST request to Items" do
  scenario "and I can create an item" do
    all_items = create_list(:item, 7)

    post '/api/v1/items', :item => {name: "new item", description: "new description", image_url: "new image"}

    expect(response).to be_successful

    response = JSON.parse(response.body)

    expect(Item.all.count).to eq(8)
    expect(Item.last["name"]).to eq("new item")
    expect(Item.last["description"]).to eq("new description")
    expect(Item.last["image_url"]).to eq("new image")
  end
end
