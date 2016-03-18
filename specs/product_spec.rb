require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Product do
  let(:products) { FarMar::Product.all }
  # make sure there is a market class
  it "Is there a class? Anything?" do
    FarMar::Product.wont_be_nil
  end

  # test self.all method to make sure it makes an array of product instances
  it "self.all returns an array of instances!" do
    products.class.must_equal Array
  end

  # test the self.find(id) returns correct instance
  it "self.find(id) returns its corresponding instance" do
    FarMar::Product.find(36).name.must_equal "Mute Beef"
  end

  # test vendors method
  it "should return instance of vendor associated with product" do 
    products[35].vendor(1).must_be_instance_of FarMar::Vendor
  end

  # test sales method
  it "should return a collection of sale instances for a product id" do 
    products[1].sales(132).class.must_equal Array
    products[5].sales(1).length.must_equal 7
    products[66].sales(5).length.must_equal 2
    products[1].sales(132)[0].must_be_instance_of FarMar::Sale
  end

  # tests number_of_sales method
  it "should return number of sales for a certain product" do
    products[5].number_of_sales(1).class.must_equal Fixnum
    products[5].number_of_sales(1).must_equal 7
  end  

  # test self.by_vendor method
  it "should return all product (instances) sold by certain vendor" do
    FarMar::Product.by_vendor(99).length.must_equal 5
    FarMar::Product.by_vendor(99)[0].class.must_equal FarMar::Product
  end

  # test self.most_revenue(n) method
  # it "should return top 10 products by revenue" do
  #   FarMar::Product.most_revenue(10).class.must_equal Array
  # end
end