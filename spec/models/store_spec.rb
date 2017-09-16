require 'rails_helper'

RSpec.describe "Store can be created" do
  scenario "with valid attributes" do
    store_attrs = {longName: "store name",
                   storeType: "type",
                   city: "Houston",
                   distance: "2",
                   phone: "7139007643"}

    test_store = Store.new(store_attrs)
    expect(test_store.long_name).to eq("store name")
    expect(test_store.store_type).to eq("type")
    expect(test_store.phone_number).to eq("7139007643")
    expect(test_store.city).to eq("Houston")
    expect(test_store.distance).to eq("2")
  end
end
