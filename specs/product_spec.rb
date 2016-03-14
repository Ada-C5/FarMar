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

describe "FarMar::Product#find" do
  it "should return an instance of FarMar::Product for FarMar::Product.find(1)" do
    FarMar::Product.find(1).must_be_instance_of FarMar::Product
  end

  it "should return 'Dry Beets' for instance of FarMar::Product.find(1)" do
    FarMar::Product.find(1).name.must_equal "Dry Beets"
  end
end
