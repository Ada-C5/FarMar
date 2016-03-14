require_relative './spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_product'

describe FarMar::Product do
  it "should be an object we have access to" do
    FarMar::Product.wont_be_nil
  end

  it "should create an instance of the FarMar::Product class" do
    # won't exist without other ones existing too
    product_hash = {

    }

    product = FarMar::Product.new(product_hash)
    product.wont_be_nil
  end
end
