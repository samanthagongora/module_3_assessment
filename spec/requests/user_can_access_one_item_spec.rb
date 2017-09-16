require 'rails_helper'

RSpec.describe "As a user I can make an API call to a single Item" do
  scenario "and I can see the item id, name, description, and image_url" do
    create(:item, id: 1)

    get '/api/v1/items/1'

    expect(response).to be_successful

    response = JSON.parse(response.body)

    expect(response["id"]).to_not be_nil
    expect(response["name"]).to_not be_nil
    expect(response["description"]).to_not be_nil
    expect(response["image_url"]).to_not be_nil
    expect(response["created_at"]).to be_nil
    expect(response["updated_at"]).to be_nil
  end
end
