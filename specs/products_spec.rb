require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Products do
  it "is an object that isn't empty" do
    FarMar::Products.wont_be_nil
  end

  describe "FarMar::Products#self.all" do
    it "should return an array with all products" do
      FarMar::Products.all.must_be_instance_of Array
    end

    it "should return an array with all 8193 products" do
      FarMar::Products.all.length.must_equal 8193
    end
  end

  describe "FarMar::Products#self.find" do
    it "should return object's product name equal to Agreeable Beef" do
      FarMar::Products.find("6676").product_name.must_equal "Agreeable Beef"
    end

    it "should return an object of the class Products" do
      FarMar::Products.find("1142").must_be_instance_of FarMar::Products
    end

  end
end
