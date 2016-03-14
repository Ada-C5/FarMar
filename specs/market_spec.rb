require_relative './spec_helper'
require_relative '../farmar'

describe "FarMar::Market" do
  it "can create a new instance from markets.csv" do
    market = FarMar::Market.new(0)
    assert_equal "People's Co-op Farmers Market", market.name
  end

  describe "FarMar::Market#all" do
    it "returns new instances of Market for each entry in csv" do
      assert_equal (FarMar::Market.all).length, FarMar::Market::MARKET_CSV.length
    end

    it "returns instances of Market" do
      assert_equal (FarMar::Market.all)[1].class, FarMar::Market
    end
  end
end
