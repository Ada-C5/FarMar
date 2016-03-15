require_relative './spec_helper'

describe FarMar::Vendor do

  VENDOR_TEST = [2, "name", 3, 4] #vid, name, employees, mid
  describe "Vendor#new" do
    it "can create new instances of Vendor with correct amount" do
      vendor = FarMar::Vendor.new(VENDOR_TEST)
      vendor.market_id.must_equal 4
    end
  end

  describe "Vendor#all" do
    it "can create new instances of Vendor from csv as hash collection" do
      FarMar::Vendor.all
      FarMar::Vendor.all.must_be_instance_of Hash
    end
  end

  describe "Vendor#find" do
    it "can find an instance of a vendor by matching vendor id" do
      FarMar::Vendor.find(7).must_be_instance_of FarMar::Vendor #7th instance
    end
  end
end
