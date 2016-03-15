require_relative "./spec_helper"


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

      it "should return the number of vendors in a particular market" do
        vendors_array = FarMar::Market.find(9)
        vendors_array.vendors.length.must_equal 10
      end

#DO SOME OTHER TestTaskit "can't find themarket"
#FarMar::Market.find(2_000).must_equal nil
    #
    # it "returns an array full of FarMar::Market instances" do
    #   classes = FarMar::Market.all.map { |m| m.class }#asking what class everythign in the array is
    #   classes.uniq.must_equal[farmer::market]
    # end
end
