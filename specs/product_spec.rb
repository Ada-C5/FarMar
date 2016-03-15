require_relative './spec_helper'

describe FarMar::Product do

  PROUCT_TEST = [1, "name", 3] #pid, name, vid
  let(:item) {FarMar::Product.new(PROUCT_TEST)}
  describe "Product#new" do
    it "can create new instances of Product with correct name" do
      item.name.must_equal "name"
    end
  end

  describe "Product#find" do
    it "can find an instance of a product by matching product id" do
      FarMar::Product.find(286).must_be_instance_of FarMar::Product
    end
  end

  describe "Product#vendor" do
    it "can find an instance of vendor from an instance of product('s vendor_id)" do
      item.vendor.must_be_instance_of FarMar::Vendor
    end
  end

  describe "Product#sales" do
    it "can find all instances of sale from an instance of product id" do
      item.sales.must_be_instance_of Hash
    end
  end

  describe "Product#number_of_sales" do
    it "can find the number of sale from an instance of product id" do
      item.number_of_sales.must_equal 7
    end
  end

  describe "Product by_vendor_id" do
    it "returns all products with vendor_id" do
      FarMar::Product.by_vendor(3).must_be_instance_of Hash
    end
  end
end
