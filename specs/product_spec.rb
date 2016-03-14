require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Product do
  it "is an object that I have access to" do
    FarMar::Product.wont_be_nil
  end
end