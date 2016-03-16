require_relative 'spec_helper'

describe FarMar::Market do
  let(:all_markets) { FarMar::Market.all }
  let(:market) { FarMar::Market.new(id: "14", name: "Hartford Farmers Market", address: "1 Block North of Highway 60 on Rural Street", city: "Hartford", county: "Washington", state: "Wisconsin", zip: "53027") }

  it "exists" do
    FarMar::Market.wont_be_nil
  end

  describe "Market#markets_with_nil" do
    it "knows about markets with missing info and stores them in an array" do
      # uncomment the following line to see the markets_with_nil array
      # p FarMar::Market.markets_with_nil
      FarMar::Market.markets_with_nil.must_be_instance_of Array
    end
  end

  describe "Market#list_markets_missing_info" do
    it "can list markets with missing their info" do
      skip
      FarMar::Market.list_markets_missing_info
    end
  end

  describe "Market#self.all" do
    it "creates an array of Market objects" do
      all_markets.must_be_instance_of Array
      all_markets[0].must_be_instance_of FarMar::Market
    end
  end

  describe "Market#self.find(find_id)" do
    it "returns the Market object with matching id" do
      this_id = all_markets[13].id

      market.must_be_instance_of FarMar::Market
      market.id.must_equal this_id
      market.name.must_equal "Hartford Farmers Market"
    end
  end

  describe "Market#vendors" do
    it "should return all instances of Vendor that match the Market's id" do
      # uncomment the following line to see the vendors array
      # ap market.vendors
      market.vendors.must_be_instance_of Array
      market.vendors.length.must_equal 8
      market.vendors[0].market_id.must_equal "14"
    end
  end

end
