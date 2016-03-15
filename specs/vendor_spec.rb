require_relative './spec_helper'
require_relative '../farmar'

describe "FarMar::Vendor" do
  let(:first_vendor) {FarMar::Vendor.new(1)}

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

  describe "FarMar::Vendor#market" do
    it "returns Market instances associated with the vendors" do
      market = first_vendor
      assert_equal 1, market.market_id
    end
  end

#products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
  describe "FarMar::Vendor#products" do
    # it "returns an array" do
    #   products = first_vendor.products
    #   products.must_be_instance_of Array
    # end

    it "returns instances of Product" do
    end

    it "returns products with the correct vendor_id" do
    end
  end
end
