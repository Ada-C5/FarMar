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

    it "will return the correct vendor for the product" do
      product.vendor.id.must_equal "261"
    end
  end

  describe "FarMar::Product#sales" do
    it "will return an array" do
      product.sales.must_be_instance_of Array
    end

    it "will return the correct sales for the product" do
      product.sales[0].amount.must_equal 6298.0
    end
  end

  describe "FarMar::Product#number_of_sales" do
    it "will return a number" do
      product.number_of_sales.must_be_instance_of Fixnum
    end

    it "will return the correct number of sales for the product" do
      product.number_of_sales.must_equal 2
    end

  end

  describe "FarMar::Product#self.by_vendor" do
    it "will return an array" do
      FarMar::Product.by_vendor(261).must_be_instance_of Array
    end
  end

end
