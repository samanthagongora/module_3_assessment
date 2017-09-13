require 'rails_helper'

RSpec.describe "As a user I can make an API call to Items" do
  scenario "and I can see all items ids, names, descriptions, and image_url" do
    all_items = create_list(:item, 7)
    get '/api/v1/items'

    expect(response).to be_successful

    response_items = JSON.parse(response.body)

    expect(response_items.count).to eq(7)
    expect(response_items.first["id"]).to_not be_nil
    expect(response_items.first["name"]).to_not be_nil
    expect(response_items.first["description"]).to_not be_nil
    expect(response_items.first["image_url"]).to_not be_nil
    # expect(response_items.first["created_at"]).to be_nil
    # expect(response_items.first["updated_at"]).to be_nil
  end
end
