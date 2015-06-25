require "rails_helper"

RSpec.describe "Demographic service" do
  describe "demographic" do
    it "returns demographic results for valid lat and longitude" do
      VCR.use_cassette("demographic_results") do
        demographic_service = DemographicService.new
        demo = demographic_service.generate_demographics(47.591094, -122.24651)
        expect(demo["incomeBelowPoverty"]).to eq(0.122)
      end
    end

  end
end
