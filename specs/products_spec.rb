require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Products do
  it "is an object that isn't empty" do
    FarMar::Products.wont_be_nil
  end
end
