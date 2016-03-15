require_relative './spec_helper'

describe FarMar::Vendor do

  VENDOR_TEST = [2, "name", 3, 4] #vid, name, employees, mid
  let(:vendor) {FarMar::Vendor.new(VENDOR_TEST)}
  let(:all_vendors) {FarMar::Vendor.all}
  describe "Vendor new" do
    it "can create new instances of Vendor with correct amount" do
      vendor.market_id.must_equal 4
    end
  end

  describe "Vendor all" do
    it "can create new instances of Vendor from csv as hash collection" do
      all_vendors.must_be_instance_of Hash
    end
  end

  describe "Vendo find" do
    it "can find an instance of a vendor by matching vendor id" do
      FarMar::Vendor.find(7).must_be_instance_of FarMar::Vendor #7th instance
    end
  end

  describe "Vendor#market" do
    it "can find an instance of market associated with an instance of vendor" do
      vendor.market.must_be_instance_of FarMar::Market
    end
  end

  describe "Vendor#products" do
    it "can find instances of all products associated with an instance of vendor" do
      vendor.products.must_be_instance_of Hash
    end
  end

  describe "Vendor#sales" do
    it "can find instances of all sales associated with an instance of vendor" do
      vendor.sales.must_be_instance_of Hash
    end
  end

  describe "Vendor#revenue" do
    it "can sum all sales associated with an instance of vendor" do
      vendor.revenue.must_be_instance_of Fixnum
    end
  end
end
