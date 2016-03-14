require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Vendors do
  it "is an object that isn't empty" do
    FarMar::Vendors.wont_be_nil
  end

  describe "FarMar::Vendors#self.all" do
    it "should return an array with all vendors" do
      FarMar::Vendors.all.must_be_instance_of Array
    end

    it "should return an array with all 2690 vendors" do
      FarMar::Vendors.all.length.must_equal 2690
    end
  end

  describe "FarMar::Vendors#self.find" do
    it "should return object's city Cruickshank Group" do
      FarMar::Vendors.find("2676").vendor_name.must_equal "Cruickshank Group"
    end

    it "should return an object of the class Vendors" do
      FarMar::Vendors.find("142").must_be_instance_of FarMar::Vendors
    end

  end
end
