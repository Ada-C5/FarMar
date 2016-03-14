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

end
