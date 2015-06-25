require "rails_helper"

feature "user can visit results page" do
  it "is the landing page to the map page to the landing page" do
    visit '/'
    within(".name") do
      expect(page).to have_content("BizzSpot")
    end

    click_link_or_button "Search"

    expect(current_path).to eq('/results')

    expect(page).to have_content("Ex. 2221 66th ave se mercer island wa")

    find('.brand-logo').click

    expect(current_path).to eq('/')
  end
end
