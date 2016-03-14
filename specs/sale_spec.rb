require_relative './spec_helper'
require_relative '../farmar'

describe "FarMar::Sale#all" do
  it "returns new instances of Sale for each entry in csv" do
    assert_equal (FarMar::Sale.all).length, FarMar::Sale::SALE_CSV.length
  end

  it "returns instances of Sale" do
    assert_equal (FarMar::Sale.all)[1].class, FarMar::Sale
  end
end
