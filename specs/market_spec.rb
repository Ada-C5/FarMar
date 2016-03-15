require_relative './spec_helper'
require_relative '../farmar'

describe "FarMar::Market" do
  let(:first_market) {FarMar::Market.new(1)}
  let(:all_markets) {FarMar::Market.all}
  it "can create a new instance from markets.csv" do
    first_market
    assert_equal "People's Co-op Farmers Market", first_market.name
  end

  describe "FarMar::Market#all" do
    it "returns new instances of Market for each entry in csv" do
      assert_equal all_markets.length, FarMar::Market::MARKET_CSV.length
    end

    it "returns instances of Market" do
      assert_equal (all_markets)[1].class, FarMar::Market
    end
  end

  describe "FarMar::Market#find" do
    it "returns an instance of Market" do
      market = FarMar::Market.find(2)
      market.must_be_instance_of FarMar::Market
    end

    it "finds the requested market by matching id" do
      market = FarMar::Market.find(2)
      assert_equal 2, market.market_id
    end
  end

  describe "FarMar::Market#vendors" do
    it "returns a collection" do
      vendors = FarMar::Market.vendors(2)
      vendors.must_be_instance_of Array
    end

    it "collection consists of Vendor instances" do
      vendor_instances = FarMar::Market.vendors(2)
      vendor_instances[0].must_be_instance_of FarMar::Vendor
    end

    it "Vendor instances have requested market_id" do
      vendors = FarMar::Market.vendors(2)
      print vendors
      assert_equal 2, vendors[0].market_id
    end
  end
end
