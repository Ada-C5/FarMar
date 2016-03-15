require_relative 'spec_helper'

describe FarMar::Product do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Product.wont_be_nil
  end

  # runs the .all method to create instances for each row in products.csv
  # checks the length
  it "returns total number of products => 8193 instances" do
    products = FarMar::Product.all
    products.length.must_equal(8193)
  end

  # check the .find(id) method
  it "should return the id of the instance if .find(id = 1)" do
    FarMar::Product.find(1).id.must_equal(1)
  end


end
