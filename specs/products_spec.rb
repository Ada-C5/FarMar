require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Product do
  it "is an object that isn't empty" do
    FarMar::Product.wont_be_nil
  end

  describe "FarMar::Product#self.all" do
    it "should return an array with all products" do
      FarMar::Product.all.must_be_instance_of Array
    end

    it "should return an array with all 8193 products" do
      FarMar::Product.all.length.must_equal 8193
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
end
