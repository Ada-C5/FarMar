require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Vendor do
  # make sure there is a sale class
  it "Is there a class? Anything?" do
    FarMar::Vendor.wont_be_nil
  end

  # make sure self.all works
  it "should return an array of vendors" do
    vendors = FarMar::Vendor.all
    vendors.class.must_equal Array
    vendors[4].name.must_equal "Reynolds, Schmitt and Klocko"
  end

  # test self.find(id)
  it "should return the right account with id" do
    FarMar::Vendor.find(44).name.must_equal "Kassulke, Leannon and Bins"
    FarMar::Vendor.find(28).ven_id.must_equal 28
  end

  # test find_market(mar_id) method
  it "should return an array of vendor instances who have same mar_id as passed" do
    in_market = FarMar::Vendor.find_market(44)
    in_market.class.must_equal Array
    in_market[0].mar_id.must_equal 44
    in_market[1].mar_id.must_equal 44
  end

  # another test for find_market
  it "AGAIN it should return array of vendors with same mar_id" do
    in_market = FarMar::Vendor.find_market(2)
    in_market[0].mar_id.must_equal 2
    in_market.length.must_equal 3
    in_market[0].class.must_equal FarMar::Vendor
  end

    # another test for find_market
  it "AGAIN it should return array of vendors with same mar_id" do
    in_market = FarMar::Vendor.find_market(200)
    in_market.length.must_equal 5
  end
end