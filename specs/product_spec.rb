require_relative './spec_helper'

describe FarMar::Product do
  let(:product_ten) { FarMar::Product.find(10) }
  
  it "is an object that I have access to" do
    FarMar::Product.wont_be_nil
  end

  describe "FarMar::Product class methods" do

    it "should return an array when calling the self.all method" do
      FarMar::Product.all.must_be_instance_of Array
    end

    it "should return a specific instance of FarMar::Product using the self.find method" do
      product_ten.id.must_equal 10
      product_ten.name.must_equal "Black Apples"
      product_ten.must_be_instance_of FarMar::Product
    end
  end

  describe "FarMar::Product#vendor" do
    let(:vendor) { product_ten.vendor }

    it "should return a specific instance of class FarMar::Vendor" do
      vendor.must_be_instance_of FarMar::Vendor
      vendor.id.must_equal 5
      vendor.name.must_equal "Reynolds, Schmitt and Klocko"
    end
  end

  describe "FarMar::Product sales methods" do
    let(:sales) { product_ten.sales }
    let(:sales_of_id_ten) { product_ten.number_of_sales }
    let(:sales_of_id_four) { FarMar::Product.find(4).number_of_sales }

    it "should return an Array of sales associated with the product id when #sales is called" do
      sales.must_be_instance_of Array
      sales.length.must_equal 1
      sales.first.id.must_equal 27
      sales.first.amount.must_equal 2851
    end

    it "should return the number of times a product has been sold when #number_of_sales is called" do
      sales_of_id_ten.must_equal 1
      sales_of_id_four.must_equal 8
    end
  end
end