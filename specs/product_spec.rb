require_relative './spec_helper'

describe FarMar::Product do
  let (:product) { FarMar::Product.find(819) }
  it "will not be nil" do
    FarMar::Product.wont_be_nil
  end


  describe "FarMar::Product#self.all" do
    it "will not be nil" do
      FarMar::Product.all.wont_be_nil
    end
  end

  describe "FarMar::Product#self.find(id)" do
    it "will not be nil" do
      product.wont_be_nil
    end

    it "will find the correct instance" do
    product.name.must_equal "Righteous Bread"
    end

    it "returns false if it can't find the product" do
      FarMar::Product.find(3_000_000).must_equal false
    end

    it "knows data about a particular product" do
      product.name.must_equal "Righteous Bread"
    end
  end

  describe "FarMar::Product#vendor" do
    it "will not be nil" do
      product.vendor.wont_be_nil
    end
  end


end
