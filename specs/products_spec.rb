require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Product do
  let(:all_products) { FarMar::Product.all }
  let(:product_test) { FarMar::Product.new("10","Black Apples","5") }
  let(:vendor_test) { FarMar::Vendor.new( "22","Runolfsson and Sons","2","7") }

  it "is an object that isn't empty" do
    FarMar::Product.wont_be_nil
  end

  describe "FarMar::Product#self.all" do
    it "should return an array with all products" do
      all_products.must_be_instance_of Array
    end

    it "should return an array with all 8193 products" do
      all_products.length.must_equal 8193
    end
  end

  describe "FarMar::Product#self.find" do
    it "should return object's product name equal to Agreeable Beef" do
      FarMar::Product.find("6676").product_name.must_equal "Agreeable Beef"
    end

    it "should return an object of the class Product" do
      FarMar::Product.find("1142").must_be_instance_of FarMar::Product
    end

  end

  describe "FarMar::Product#vendor" do
    it "should return object's product name equal to Agreeable Beef" do
      product_test.vendor.must_be_instance_of Array
    end

    it "should return to more one only vendor that sells that product" do
      product_test.vendor.length.must_equal 1
    end

    it "should return an object of the class Vendor" do
      classes = product_test.vendor.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Vendor]
    end
  end

  describe "FarMar::Product#sales" do
    it "should return object's product name equal to Agreeable Beef" do
      product_test.sales.must_be_instance_of Array
    end

    it "should return an object of the class Vendor" do
      classes = product_test.sales.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Sale]
    end

  end

  describe "FarMar::Product#self.by_vendor(vendor_id)" do
    it "returns an ARRAY with all of the products with the given vendor_id" do
      FarMar::Product.by_vendor("8").must_be_instance_of Array
    end

    it "each element in the array should be an object of the class Product" do
      classes = FarMar::Product.by_vendor(2416).map { |m| m.class }
      classes.uniq.must_equal [FarMar::Product]
    end

  end

end
