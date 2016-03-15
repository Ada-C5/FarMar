require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Market do
  it "is an object that isn't empty" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Market#self.all" do
    let(:all_markets) { FarMar::Market.all }

    it "should return an array with all markets" do
      all_markets.must_be_instance_of Array
    end

    it "should return an array with all 500 markets" do
      all_markets.length.must_equal 500
    end

    it "each element in the array is a instance of FarMar::Mar" do
      classes = all_markets.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Market]
    end
  end

  describe "FarMar::Market#self.find" do
    let (:market) { FarMar::Market.find("142") }

    it "should return object's city Wildwood" do
      market.market_city.must_equal "Wildwood"
    end

    it "should return an object of the class Market" do
      market.must_be_instance_of FarMar::Market
    end

    # it "should return nil if the market does not exist" do
    #   FarMar::Market.find("504").must_equal nil
    # end
  end

  describe "FarMar::Market#vendor" do
    let(:market_test) { FarMar::Market.new("18", "Grand Valley State University Farmers Market", "1 Campus Drive, Parking Lot F", "Allendale", "Ottawa", "Michigan", "49504") }

    it "should return object vendor that matches the market_id" do
      market_test.vendors.length.must_equal 10
    end

    it "should return an object of the class Market" do
      market_test.vendors.must_be_instance_of Array
    end
  end
end
