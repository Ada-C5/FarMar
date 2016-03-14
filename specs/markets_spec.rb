require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Markets do
  it "is an object that isn't empty" do
    FarMar::Markets.wont_be_nil
  end

  describe "FarMar::Markets#self.all" do
    it "should return an array with all markets" do
      FarMar::Markets.all.must_be_instance_of Array
    end

    it "should return an array with all 500 markets" do
      FarMar::Markets.all.length.must_equal 500
    end
  end

  describe "FarMar::Markets#self.find" do
    it "should return object's city Wildwood" do
      FarMar::Markets.find("142").market_city.must_equal "Wildwood"
    end

    it "should return an object of the class Markets" do
      FarMar::Markets.find("142").must_be_instance_of FarMar::Markets
    end

  end
end
