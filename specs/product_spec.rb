require_relative './spec_helper'
require_relative '../farmar'

describe "FarMar::Product" do
  describe "FarMar::Product#all" do
    it "returns new instances of Product for each entry in csv" do
      assert_equal (FarMar::Product.all).length, FarMar::Product::PRODUCT_CSV.length
    end

    it "returns instances of Product" do
      assert_equal (FarMar::Product.all)[1].class, FarMar::Product
    end
  end

  describe "FarMar::Product#find" do
    it "returns an instance of Product" do
      product = FarMar::Product.find(2)
      product.must_be_instance_of FarMar::Product
    end

    it "finds the requested product by matching id" do
      product = FarMar::Product.find(2)
      assert_equal 2, product.product_id
    end
  end
end
