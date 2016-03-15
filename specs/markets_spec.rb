require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Market do
  it "is an object that isn't empty" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Market#self.all" do
    it "should return an array with all markets" do
      FarMar::Market.all.must_be_instance_of Array
    end

    it "should return an array with all 500 markets" do
      FarMar::Market.all.length.must_equal 500
    end
  end

  describe "FarMar::Market#self.find" do
    it "should return object's city Wildwood" do
      FarMar::Market.find("142").market_city.must_equal "Wildwood"
    end

    it "should return an object of the class Market" do
      FarMar::Market.find("142").must_be_instance_of FarMar::Market
    end
  end

  describe "FarMar::Market#vendor" do
    it "should return object vendor that matches the market_id" do
      market_test = FarMar::Market.new("18", "Grand Valley State University Farmers Market", "1 Campus Drive, Parking Lot F", "Allendale", "Ottawa", "Michigan", "49504")
      market_test.vendors.length.must_equal 10
    end

    # it "should return an object of the class Market" do
    #   market_test2 = FarMar::Market.new(121, "Grand Valley State University Farmers Market", "1 Campus Drive, Parking Lot F", "Allendale", "Ottawa", "Michigan", "49504")
    #   market_test2.vendors.must_be_instance_of Array
    #
    # end
  end
end
