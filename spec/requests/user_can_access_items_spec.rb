require 'rails_helper'

RSpec.request "As a user I can make an API call to Items" do
  scenario "and I can see all items ids, names, descriptions, and image_url" do
    items = create_list(:item, 7)
    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(7)
  end
end

# And each item has an id, name, description, and image_url but not the created_at or updated_at
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# * Verify that your non-GET requests work using Postman or curl.
# (Hint: `ActionController::API`).
# Why doesn't the default `ApplicationController` support POST and PUT requests?
