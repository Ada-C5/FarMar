require_relative "./spec_helper"
require_relative "../far_mar"
#require_relative "../farmar_product"

describe FarMar::Product do
  it "it is an object we have acccess to" do
    FarMar::Product.wont_be_nil
  end
end
