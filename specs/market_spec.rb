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
      # ap FarMar::Market.markets_with_nil
      missinginfo = FarMar::Market.markets_with_nil
      missinginfo.must_be_instance_of Array
      missinginfo[0].must_be_instance_of String
      missinginfo[0][0].to_i.must_be_instance_of Fixnum
      assert(missinginfo[0][0].to_i > 0, "The first character is not a fixnum, meaning it's not the market id")
    end
  end

  describe "Market#self.all" do
    it "creates an array of Market objects" do
      all_markets.must_be_instance_of Array
      all_markets.last.must_be_instance_of FarMar::Market
    end

    it "has objects with the correct data" do
      all_markets[13].id.must_equal "14"
      all_markets[13].name.must_equal "Hartford Farmers Market"
      all_markets[13].city.must_equal "Hartford"
      all_markets[13].state.must_equal "Wisconsin"
    end
  end

  describe "Market#self.find(find_id)" do
    it "returns the Market object with matching id" do
      this_id = all_markets[13].id

      # FarMar::Market.find(14).must_be_instance_of FarMar::Market
      FarMar::Market.find(14).id.must_equal this_id
      # FarMar::Market.find(14).name.must_equal "Hartford Farmers Market"
    end
  end

  describe "Market#self.search(search_term)" do
    it "returns an array of markets that amtch the search term" do
      FarMar::Market.search("school").length.must_equal 3
      FarMar::Market.search("Zulauf").length.must_equal 19
    end
  end

  describe "Market#vendors" do
    it "should return all instances of Vendor that match the Market's id" do
      # uncomment the following line to see the vendors array
      # ap market.vendors
      market.vendors.must_be_instance_of Array
      market.vendors.length.must_equal 8
      market.vendors.last.market_id.must_equal "14"
    end
  end

  describe "Market#products" do
    it "finds all of the products at the market" do
      market.products.must_be_instance_of Array
      market.products.last.must_be_instance_of FarMar::Product
      assert market.products.collect { |prod| prod.vendor_id }.include? "64"
    end
  end

  describe "Market#prefered_vendor" do
    it "finds the market's vendor with the highest revenue" do
      # uncomment the following line to see the prefered vendor for market 14
      # ap market.prefered_vendor
      market.prefered_vendor.name.must_equal "Schowalter, Runolfsson and Muller"
    end
  end

  describe "Market#worst_vendor" do
    it "finds the market's vendor with the lowest revenue" do
      # uncomment the following line to see the worst vendor for market 14
      # ap market.worst_vendor
      market.worst_vendor.name.must_equal "Reilly-Howell"
    end
  end


end
