require "rails_helper"

RSpec.describe "Best Buy Service" do
  context "class methods" do
    context ".find_stores" do
      it "finds stores by zipcode" do
        VCR.use_cassette("service_can_return_data_spec.rb") do
          zipcode = 80203
          store_data = BestBuyService.find_stores(zipcode)
          store = store_data[:stores].first
          stores = store_data[:stores]
          total_stores = store_data[:total]

          expect(stores.count).to eq(10)
          expect(total_stores).to eq(17)

          expect(store[:longName]).to be_a String
          expect(store[:city]).to be_a String
          expect(store[:distance]).to be_a Float
          expect(store[:phone]).to be_a String
          expect(store[:storeType]).to be_a String
        end
      end
    end
  end
end
