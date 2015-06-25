require 'rails_helper'

RSpec.describe Search, type: :model do
    let(:address){ "2221 66th ave se mercer island wa" }
    let(:search1){ Search.create(address: address) }

    let(:map_result){ {features: "fish"}.to_json }
    let(:lat){ 39.54763 }
    let(:long){ -104.800879 }

    describe 'callbacks' do
      describe '.set_coordinates' do
        it 'calls location on an instance of Map Service' do
          MapboxService.any_instance.should_receive(:location).with(address).and_return({:coordinates => [1, 1]})
          search1.set_coordinates
        end
      end
    end

    describe 'methods' do

      before do
        mapbox_result = {:address=>"9350 Amison Cir Parker CO", :coordinates=>[lat, long]}
        MapboxService.any_instance.stub(:location).and_return(mapbox_result)
      end

    describe '.demographic_data' do
      it 'calls out to Demographic Service' do
        result = {"blockFips"=>"530330243001035", "incomeBelowPoverty"=>0.122, "medianIncome"=>141364.0, "incomeLessThan25"=>0.08787, "incomeBetween25to50"=>0.08577, "incomeBetween50to100"=>0.28034, "incomeBetween100to200"=>0.12343, "incomeGreater200"=>0.4226, "educationHighSchoolGraduate"=>0.9805, "educationBachelorOrGreater"=>0.6223}
        DemographicService.any_instance.stub(:generate_demographics).and_return(result)
        expect(search1.demographic_data).to eq(0.6223)
      end
    end

    describe '.walkscore_data' do
      it "calls out to Walkscore Service" do
        result = {:status=>1, :walkscore=>29, :description=>"Car-Dependent", :updated=>"2015-03-26 08:09:07.247870", :logo_url=>"https://cdn.walk.sc/images/api-logo.png", :more_info_icon=>"https://cdn.walk.sc/images/api-more-info.gif", :more_info_link=>"https://www.redfin.com/how-walk-score-works", :ws_link=>"https://www.walkscore.com/score/2221-66th-ave-se-mercer-island/lat=47.591094/lng=-122.24651/?utm_source=bizzspot.herokuapp.com&utm_medium=ws_api&utm_campaign=ws_api", :help_link=>"https://www.redfin.com/how-walk-score-works", :snapped_lat=>47.5905, :snapped_lon=>-122.247}
        WalkscoreService.any_instance.stub(:score).and_return(result)
        search1.walkscore_data
      end
    end
  end
end
