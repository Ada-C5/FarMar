require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Product do

  it "does this exist" do
    FarMar::Product.wont_be_nil
  end

  it "can create instance of product class" do
    FarMar::Product.new(name: "super-toy").must_be_instance_of(FarMar::Product)
  end

  it "can create array of all products" do
    FarMar::Product.all.class.must_equal(Array)
  end

  it "can find a product given an id" do
    FarMar::Product.find(8).name.must_equal("Shaky Honey")
  end



end
