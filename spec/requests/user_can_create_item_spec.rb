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
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
