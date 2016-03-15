require_relative './spec_helper'


describe FarMar::Market do
  it "exists" do
    FarMar::Market.wont_be_nil
  end
end

describe FarMar::Market do
  let(:market) { FarMar::Market.new(market_id: 10) }
  # before do
  #   market_data = {
  #     id: 1
  #   }
  #   @market = FarMar::Market.new(market_data)

  it "it creates a new Market instance" do
  market.must_be_instance_of(FarMar::Market)
  end
end

describe "SelfAll" do
  before do
    @markets = FarMar::Market.all # all is a self class
  end

  it "returns an array" do
    @markets.must_be_instance_of(Array)
  end

  it "returns a collection of instances from the CSV file" do
    @markets[0].must_be_instance_of(FarMar::Market)
  end
end

describe "Self.Find" do
  # one instance of a market class with an ID of 5
  # this is an actual market with all the info passed throug into the market_data hash
  let(:market) { FarMar::Market.find(5) }
  # before do
  #   @one_market = FarMar::Market.find(5)
  # end
  it "returns an instance of FarMar::Markets" do
    market.must_be_instance_of(FarMar::Market)
  end

  it "returns nil if can't find the market in question" do
    FarMar::Market.find(610).must_equal(nil)
  end

  it "returns data on the market selected" do
    # market = FarMar::Market.find(5).must_be_instance_of(FarMar::Market)
    market.id.must_equal(5)
    market.name.must_equal("Quincy Farmers Market")
    market.address.must_equal("0 Denis Ryan Parkway")
    market.city.must_equal("Quincy")
    market.county.must_equal("Norfolk")
    market.state.must_equal("Massachusetts")
    market.zip.must_equal("2169")
  end
end

describe "Vendors" do
  let(:market) { FarMar::Market.find(17) } # vendors is getting a list from an instance of market, not the class FarMar::Market
  # before do
  #   list_vendors = {
  #     id: 2,
  #     name: "Hamill, Kilback and Pfeffer"
  #   }
    # @a = FarMar::Market.new(list_vendors)
  it "returns a collection of FarMar::Vendor id instances in an array" do
    # return an Array of vendor instances(FarMar::Market)
    market.vendors.must_be_instance_of(Array)
  end

  it "returns a collection of FarMar::Vendor objects" do
    #.vendors is an instance method
    vendor = market.vendors.map { |v| v.class }
    vendor.uniq.must_equal([FarMar::Vendor])
  end

  it "returns a collection of FarMar::Vendor id instances" do
    #.vendors is an instance method getting called on markets which was set up in this test .find(17)
    vendor = market.vendors.map { |v| v.market_id } # this is taking the vendors associated with the market ID (17) and returning an rray of those vendors. [vendor1, vendor2] etc...
    vendor.uniq.must_equal([market.id])# this is taking the vendors in the array and removing the duplicates and checking to see if the market_id matches the market ID
  end
end
