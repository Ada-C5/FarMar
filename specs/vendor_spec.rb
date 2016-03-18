require_relative './spec_helper'
require_relative '../far_mar.rb'

describe FarMar::Vendor do
let(:vendor) {FarMar::Vendor.find(24)}                                      #this is testing to make sure Player exists
  it "will not be nil" do
    FarMar::Vendor.wont_be_nil
  end


  describe "Vendor#all" do
    let(:all_vendors){FarMar::Vendor.all}

    it "makes an array of all the vendors" do
      FarMar::Vendor.all.wont_be_nil
    end

    it "returns an array" do      #want to describe what the method is doing, not what the test is doing
      all_vendors.class.must_equal(Array)
    end

    it "makes sure that the first element is an instance of a Vendor/Vendor object" do
      all_vendors.first.class.must_equal(FarMar::Vendor)
    end

    it "returns an array full of FarMar::Vendor instances" do
      classes = all_vendors.map { |v| v.class }
      classes.uniq.must_equal [FarMar::Vendor]
    end


  end


  describe "Vendor#find" do

    it"makes sure that the id requested matches the id given" do
      vendor = FarMar::Vendor.find(24)
      vendor.vendor_id.must_equal("24")
    end

    it "knows basic info about a vendor" do
      vendor.vendor_id.must_equal "24"
      vendor.vendor_name.must_equal "Heaney, Schiller and Stehr"
      vendor.num_employ.must_equal "7"
      vendor.market_id.must_equal "8"
    end
  end

  describe "Vendor#products" do
    it "makes sure that the assoc_vendor_id requested matches the vendor_id given" do
      assoc_products = FarMar::Vendor.new({vendor_id: "38", vendor_name: "Marvin, Casper and Krajcik", num_employ: "10", market_id: "9"}) #needs an instance of market bc vendors is an instance method
      product_collection = assoc_products.products(38)
      product_collection.last.vendor_id.must_equal "38"
    end
  end

  describe "Vendor#sales" do
    it "makes sure that the assoc_vendor_id requested matches the vendor_id given" do
      assoc_sales = FarMar::Vendor.new({vendor_id: "64", vendor_name: "Larson, Mosciski and Murazik", num_employ: "6", market_id: "14"})
      sales_collection = assoc_sales.sales(64)
      sales_collection.last.vendor_id.must_equal "64"
      sales_collection.first.vendor_id.must_equal "64"
    end
  end


  describe "Vendor#market" do
    it "makes sure that when we call market method on the new instance of Vendor we get the correct one" do
      vendor.market.market_id.must_equal("8")
    end
  end

  describe "Vendor#revenue" do
    it "makes sure that when we call revenue method on the new instance of Vendor, we get the correct sum of all the amounts" do
      vendor.revenue.must_equal(9116)
    end
  end

  describe "Vendor#by_market" do
    it "makes sure the vendor_id for the first market in the returned array is correct" do
      FarMar::Vendor.by_market(500)[0].vendor_id.must_equal("2681")

    end

  end

end
