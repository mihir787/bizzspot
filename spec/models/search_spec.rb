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
          MapboxService.any_instance.should_receive(:location).with(address)
        end
      end
    end

    describe 'methods' do

      before do
        mapbox_result = {:address=>"9350 Amison Cir Parker CO", :coordinates=>[long, lat]}
        MapboxService.any_instance.stub(:location).and_return(mapbox_result)
      end

    describe '.demographic_data' do
      it 'calls out to Demographic Service' do
        expect_any_instance_of(DemographicService).to receive(:generate_demographics).with(lat, long)
        search1.median_income
      end
    end

    describe '.walkscore_data' do
      it "calls out to Walkscore Service" do
        expect_any_instance_of(WalkscoreService).to receive(:score).with(address, lat, long)
        search1.walkscore
      end
    end
  end
end
