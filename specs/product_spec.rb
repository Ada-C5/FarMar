require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Product do
  # make sure there is a market class
  it "Is there a class? Anything?" do
    FarMar::Product.wont_be_nil
  end

  # test self.all method to make sure it makes an array of product instances
  it "self.all returns an array of instances!" do
    FarMar::Product.all.class.must_equal Array
  end

  # test the self.find(id) returns correct instance
  it "self.find(id) returns its corresponding instance" do
    FarMar::Product.find(36).name.must_equal "Mute Beef"
  end

  # test vendors method
  it "should return instance of vendor associated with product" do 
    FarMar::Product.all[35].vendor(1).must_be_instance_of FarMar::Vendor
  end
end