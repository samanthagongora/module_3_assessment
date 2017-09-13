require 'rails_helper'

RSpec.describe "Iser can search for Best Buy stores" do
  scenario "and return stores within 25 miles" do
    visit root_path

    fill_in 'q', with: "80202"
    click_on 'search'

    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_css('.store', 10)
    within first('.store') do
      expect(page).to have_css('.long_name')
      expect(page).to have_css('.city')
      expect(page).to have_css('.distance')
      expect(page).to have_css('.phone_number')
      expect(page).to have_css('.store_type')
    end
  end
end
