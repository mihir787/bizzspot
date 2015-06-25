require "rails_helper"

RSpec.describe "Mapbox service" do
  describe "mapbox" do
    it "returns location results from mapservice for valid address" do
      VCR.use_cassette("location_results") do
        map_service = MapboxService.new
        location = map_service.location("2221 66th ave se mercer island wa")
        expect(location[:coordinates]).to eq([-122.24651, 47.591094])
      end
    end

  end
end
