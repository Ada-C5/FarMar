
require_relative './spec_helper'
require_relative '../far_mar.rb'

describe FarMar::Product do                                         #this is testing to make sure Player exists
  it "will not be nil" do
    FarMar::Product.wont_be_nil
  end
end

describe "Product#all" do
  let(:all_products){FarMar::Product.all}

  it "makes an array of all the products" do
    all_products.wont_be_nil
  end

  it "returns an array" do      #want to describe what the method is doing, not what the test is doing
    all_products.class.must_equal(Array)
  end

  it "makes sure that the first element is an instance of a Product/Product object" do
    all_products.first.class.must_equal(FarMar::Product)
  end

  it "returns an array full of FarMar::Product instances" do
    classes = all_products.map { |p| p.class }
    classes.uniq.must_equal [FarMar::Product]
  end
end


describe "Product#find" do
  let(:product) {FarMar::Product.find(32)}

  it"makes sure that the id requested matches the id given" do
    product = FarMar::Product.find(32)
    product.product_id.must_equal("32")
  end

  it "knows basic info about a product" do
    product.product_id.must_equal "32"
    product.product_name.must_equal "Disgusted Carrots"
    product.vendor_id.must_equal "11"
  end
end
