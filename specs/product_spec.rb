require_relative './spec_helper'
require_relative '../farmar'

describe "FarMar::Product#all" do
  it "returns new instances of Product for each entry in csv" do
    assert_equal (FarMar::Product.all).length, FarMar::Product::PRODUCT_CSV.length
  end

  it "returns instances of Product" do
    assert_equal (FarMar::Product.all)[1].class, FarMar::Product
  end
end
