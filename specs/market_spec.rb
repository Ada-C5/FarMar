require_relative './spec_helper'
require_relative '../far_mar.rb'

describe FarMar::Market do           #this is testing to make sure Player exisT
it "will not be nil" do
    FarMar::Market.wont_be_nil
  end


  describe "Market#all" do
    let(:all_markets) {FarMar::Market.all}

    it "makes an array of all the markets" do
      all_markets.wont_be_nil
    end

    it "returns an array" do      #want to describe what the method is doing, not what the test is doing
      all_markets.class.must_equal(Array)      #could also do: .must_be_instance of Array
    end

    it "makes sure that the first element is an instance of a Market/Market object" do
      all_markets.first.class.must_equal(FarMar::Market)
    end

    it "returns an array full of FarMar::Market instances" do
      classes = all_markets.map{ |m| m.class }
      classes.uniq.must_equal [FarMar::Market]
    end

  end


  describe "Market#find" do
    let(:market) {FarMar::Market.find(4)}

    it "makes sure that the id requested matches the id given" do
      market = FarMar::Market.find(4)
      market.market_id.must_equal("4")
    end

    it "knows data about the market" do
      market.market_id.must_equal "4"
      market.market_name.must_equal "Preston Farmers’ Market"
      market.address.must_equal "#1 Route 164"
      market.city.must_equal "Preston"
      market.county.must_equal "New London"
      market.state.must_equal "Connecticut"
    end

  end

  describe "Market#vendors" do
    it "makes sure that the assoc_market_id requested matches the market_id given" do
      assoc_vendors = FarMar::Market.new({market_id: "6", market_name: "Jefferson City Farmer's Market", address: "000 Main Street", city: "Jefferson City", county: "Cole", state: "Missouri", zip: "0"}) #needs an instance of market bc vendors is an instance method
      vendor_collection = assoc_vendors.vendors(6)
      vendor_collection.last.market_id.must_equal "6"   #a way to do boolean false?
    end

  end

end
