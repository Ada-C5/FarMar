require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Market do
  let(:all_markets) { FarMar::Market.all }
  let (:market) { FarMar::Market.find("142") }
  let(:market_test) { FarMar::Market.new("18", "Grand Valley State University Farmers Market", "1 Campus Drive, Parking Lot F", "Allendale", "Ottawa", "Michigan", "49504") }

  it "is an object that isn't empty" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Market#self.all" do

    it "should return an ARRAY with all markets" do
      all_markets.must_be_instance_of Array
    end

    it "each element in the array is a instance of FarMar::Market" do
      classes = all_markets.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Market]
    end

    it "should return an array with all 500 markets" do
      all_markets.length.must_equal 500
    end
  end

  describe "FarMar::Market#self.find" do

    it "should return an object of the class Market" do
      market.must_be_instance_of FarMar::Market
    end

    it "should return to an object, and be ablae to acces to the objetc's data" do
      market.market_name.must_equal "Wildwood Growers' Market"
      market.market_address.must_equal "100 N. Main Street"
      market.market_county.must_equal "Sumter"
      market.market_city.must_equal "Wildwood"
      market.market_state.must_equal "Florida"
      market.market_zip.must_equal "34785"
    end

    it "should return nil if the market does not exist" do
      FarMar::Market.find("504").must_equal nil
    end
  end

  describe "FarMar::Market#vendor" do

    it "should return the instances of Vendor that matches the market_id" do
      market_test.vendors.length.must_equal 10
    end

    it "should return an ARRAY" do
      market_test.vendors.must_be_instance_of Array
    end

    it "each element in the array is a instance of FarMar::Vendor" do
      classes = market_test.vendors.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Vendor]
    end
  end

  describe "FarMar::Market#products" do
    let(:market_test) { FarMar::Market.new("18", "Grand Valley State University Farmers Market", "1 Campus Drive, Parking Lot F", "Allendale", "Ottawa", "Michigan", "49504") }

    it "should return an ARRAY" do
      market_test.products.must_be_instance_of Array
    end

    it "should return I dont know" do
      market_test.products.length.must_be :>, 10
    end

    it "returns a collection of FarMar::Product instances" do
      classes = market_test.products.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Product]
    end
  end
end
