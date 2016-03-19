require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Product do
  let(:all_products) { FarMar::Product.all }
  let(:product_test) { FarMar::Product.new("8068","Delightful Burrito","2649") }
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
    it "should return object's product and accesible to its info" do
      FarMar::Product.find("6676").product_name.must_equal "Agreeable Beef"
      FarMar::Product.find("6676").vendor_id.must_equal 2195
    end

    it "should return an object of the class Product" do
      FarMar::Product.find("1142").must_be_instance_of FarMar::Product
    end

  end

  describe "FarMar::Product#vendor" do
    it "should return an ARRAY" do
      product_test.vendor.must_be_instance_of FarMar::Vendor
    end

  end

  describe "FarMar::Product#sales" do
    it "should return an ARRAY of object's" do
      product_test.sales.must_be_instance_of Array
    end

    it "each object in that array should be an instance of the class Sale" do
      classes = product_test.sales.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Sale]
    end

  end

  describe "FarMar::Product#number_of_sales" do
    it "should return a number" do
      product_test.number_of_sales.must_be_kind_of Numeric
    end

    it "should return the number of sales" do
      product_test.number_of_sales.must_equal 10
    end

  end

  describe "FarMar::Product#self.by_vendor(vendor_id)" do
    it "returns an ARRAY with all of the products that have the given vendor_id" do
      FarMar::Product.by_vendor("8").must_be_instance_of Array
    end

    it "each element in the array should be an object of the class Product" do
      classes = FarMar::Product.by_vendor(2416).map { |product| product.class }
      classes.uniq.must_equal [FarMar::Product]
    end

  end

end
