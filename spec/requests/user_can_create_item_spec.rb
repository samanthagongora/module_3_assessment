require "rails_helper"

RSpec.describe "User can make POST request to items" do
  it "can create item" do
    post "/api/v1/items", item: {name: "new name", description: "new description", image_url: "new image"}

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
