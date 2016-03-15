require_relative './spec_helper'
require_relative '../farmar'

describe "FarMar::Vendor" do
  describe "FarMar::Vendor#all" do
    it "returns new instances of Vendor for each entry in csv" do
      assert_equal (FarMar::Vendor.all).length, FarMar::Vendor::VENDOR_CSV.length
    end

    it "returns instances of Vendor" do
      assert_equal (FarMar::Vendor.all)[1].class, FarMar::Vendor
    end
  end

  describe "FarMar::Vendor#find" do
    it "returns an instance of Vendor" do
      vendor = FarMar::Vendor.find(2)
      vendor.must_be_instance_of FarMar::Vendor
    end

    it "finds the requested vendor by matching id" do
      vendor = FarMar::Vendor.find(2)
      assert_equal 2, vendor.vendor_id
    end
  end
end
