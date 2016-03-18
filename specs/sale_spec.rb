require_relative './spec_helper'

describe FarMar::Sale do
  let(:sale_ten) { FarMar::Sale.find(10) }
  
  it "is an object that I have access to" do
    FarMar::Sale.wont_be_nil
  end

  describe "FarMar::Sale class methods" do
    let(:sales_between) { FarMar::Sale.between("2013-11-06 20:40:00 -0800", "2013-11-06 20:45:00 -0800") }
    let(:more_sales_between) { FarMar::Sale.between("2013-11-11 11:29:00 -0800", "2013-11-11 11:35:00 -0800") }

    it "should return an instance of array using self.all method" do
      FarMar::Sale.all.must_be_instance_of Array
    end

    it "should return a specific instance of FarMar::Sale using the self.find method" do
      sale_ten.must_be_instance_of FarMar::Sale
      sale_ten.id.must_equal 10
      sale_ten.amount.must_equal 5160
    end

    it "should return an array of instances within a time range using self.between method" do
      sales_between.must_be_instance_of Array
    end

    it "should include specific instances within this time period using the self.between method" do
      sales_between.first.id.must_equal 4
      sales_between.first.amount.must_equal 1634
      more_sales_between.first.id.must_equal 6
      more_sales_between.first.amount.must_equal 6950
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