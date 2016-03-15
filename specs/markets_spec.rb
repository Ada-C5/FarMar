require_relative './spec_helper'

describe FarMar::Market do
#mid, name, address, county, state, zip
  MARKET_TEST = [1, "name", "someplace", "not country", "of being", "44444"]

  describe "Market#new" do
    it "can create new instances of Market with correct name" do
      market = FarMar::Market.new(MARKET_TEST)
      market.name.must_equal "name"
    end
  end

  describe "Market#find" do
    it "can find an instance of a market by matching id" do
      FarMar::Market.find(286).must_be_instance_of FarMar::Market
    end
  end

end
