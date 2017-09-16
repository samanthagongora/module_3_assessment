require 'rails_helper'

RSpec.describe "User can search for Best Buy stores" do
  scenario "and return stores within 25 miles" do
    VCR.use_cassette("user_can_search_best_buy_stores_spec.rb") do
      visit root_path

      fill_in 'q', with: "80202"
      click_on 'Search'

      expect(current_path).to eq("/search")
      expect(page).to have_css('.store', 10)
      within first('.store') do
        expect('.long_name').to_not be_nil
        expect('.city').to_not be_nil
        expect('.distance').to_not be_nil
        expect('.phone_number').to_not be_nil
        expect('.store_type').to_not be_nil
      end
    end
  end
end
