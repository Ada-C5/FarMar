require_relative "./spec_helper"
require_relative "../far_mar"
#require_relative "../farmar_market"

describe FarMar::Market do
  it "it is an object we have acccess to" do
    FarMar::Market.wont_be_nil
  end
end

describe "FarMar#Market" do

    before do
    market_data = {
      id: 24,
      name: "Suzanne Harrison"
    }
    @market = FarMar::Market.new(market_data)
    end

      it "an instance of class Market'" do
    	 @market.must_be_instance_of(FarMar::Market)
      end

      it "should return number of all markets" do
        all_markets = FarMar::Market.all
        all_markets.length.must_equal 500
      end

      it "should return information for particular market" do
        selected_market = FarMar::Market.find(99)
        selected_market.name.must_equal "State Center Farmers Market"
      end
end
