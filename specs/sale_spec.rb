require_relative './spec_helper'

describe FarMar::Sale do
  let(:sale_ten) { FarMar::Sale.find(10) }
  
  it "is an object that I have access to" do
    FarMar::Sale.wont_be_nil
  end

  describe "FarMar::Sale class methods" do

    it "should return an instance of array using self.all method" do
      FarMar::Sale.all.must_be_instance_of Array
    end

    it "should return a specific instance of FarMar::Sale using the self.find method" do
      sale_ten.must_be_instance_of FarMar::Sale
      sale_ten.id.must_equal 10
      sale_ten.amount.must_equal 5160
    end
  end

  describe "FarMar::Sale#vendor" do
    let(:vendor) { sale_ten.vendor }

    it "should return an instance of FarMar::Vendor" do
      vendor.must_be_instance_of FarMar::Vendor
    end

    it "should return the correct vendor instance associated with sale by the vendor_id" do
      vendor.id.must_equal 3
      vendor.name.must_equal "Breitenberg Inc"
    end
  end

  describe "FarMar::Sale#product" do
    let(:product) { sale_ten.product }

    it "should return an instance of FarMar::Product" do
      product.must_be_instance_of FarMar::Product
    end

    it "should return the correct product instance associated with sale by product_id" do
      product.id.must_equal 4
      product.name.must_equal "Yummy Fruit"
    end
  end
end