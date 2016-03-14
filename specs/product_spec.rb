require_relative './spec_helper'

describe FarMar::Product do
  it "should be an object we have access to" do
    FarMar::Product.wont_be_nil
  end
end

describe "FarMar::Product#all" do
  it "should return an array of instances from products.csv file" do
    FarMar::Product.all.class.must_equal Array
  end
end
