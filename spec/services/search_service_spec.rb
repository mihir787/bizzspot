require "rails_helper"

RSpec.describe "Search internal service" do
  describe "walkscore" do
    it "returns walkscore results for valid address and longitude" do
      VCR.use_cassette("walkscore_results") do
        walkscore_service = WalkscoreService.new
        score = walkscore_service.score("2221 66th ave se mercer island wa", 47.591094, -122.24651)
        expect(score[:walkscore]).to eq(29)
      end
    end
  end
end
