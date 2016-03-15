require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Vendor do
  it "is an object that isn't empty" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor#self.all" do
    it "should return an array with all vendors" do
      FarMar::Vendor.all.must_be_instance_of Array
    end

    it "should return an array with all 2690 vendors" do
      FarMar::Vendor.all.length.must_equal 2690
    end
  end

  describe "FarMar::Vendor#self.find" do
    it "should return object's city Cruickshank Group" do
      FarMar::Vendor.find("2676").vendor_name.must_equal "Cruickshank Group"
    end

    it "should return an object of the class Vendor" do
      FarMar::Vendor.find("142").must_be_instance_of FarMar::Vendor
    end

  end

  describe "FarMar::Vendor#market" do
    before do
      @vendor_test = FarMar::Vendor.new("18", "David Jimison", "1", "404")
    end

    it "should return object vendor that matches the market_id" do
      @vendor_test.market.length.must_equal 1
    end

    # it "should return an object of the class Market" do
    #   vendor_test2 = FarMar::Vendor.new("18", "David Jimison", "1", "404")
    #   vendor_test2.market.must_be_instance_of Array
    #
    # end
  end

end
