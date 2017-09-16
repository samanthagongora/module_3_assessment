require "rails_helper"

RSpec.describe "User can make POST request to items" do
  it "can create item" do
    post "/api/v1/items", item: {name: "new name", description: "new description", image_url: "new image"}

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to_not be_nil
    expect(item["name"]).to_not be_nil
    expect(item["description"]).to_not be_nil
    expect(item["image_url"]).to_not be_nil
    expect(item["created_at"]).to be_nil
    expect(item["updated_at"]).to be_nil
  end
end
