require_relative './spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_sale'

describe FarMar::Sale do
  it "should be an object we have access to" do
    FarMar::Sale.wont_be_nil
  end

  it "should create an instance of the FarMar::Sale class" do
    # won't exist without other ones existing too
    sale_hash = {

    }

    sale = FarMar::Sale.new(sale_hash)
    sale.wont_be_nil
  end
end
