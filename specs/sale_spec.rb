require_relative './spec_helper'
require_relative '../farmar'

describe "FarMar::Sale" do
  describe "FarMar::Sale#all" do
    it "returns new instances of Sale for each entry in csv" do
      assert_equal (FarMar::Sale.all).length, FarMar::Sale::SALE_CSV.length
    end

    it "returns instances of Sale" do
      assert_equal (FarMar::Sale.all)[1].class, FarMar::Sale
    end
  end

  describe "FarMar::Sale#find" do
    it "returns an instance of Sale" do
      sale = FarMar::Sale.find(2)
      sale.must_be_instance_of FarMar::Sale
    end

    it "finds the requested sale by matching id" do
      sale = FarMar::Sale.find(2)
      assert_equal 2, sale.sale_id
    end
  end
end
