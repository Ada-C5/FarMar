require_relative './spec_helper'

describe FarMar::Sale do

  SALE_TEST = [1, 3, Time.new, 2, 4] #sid, amount, time, vid, pid

  describe "Sale#new" do
    it "can create new instances of Sale with correct amount" do
      sale = FarMar::Sale.new(SALE_TEST)
      sale.amount.must_equal 3
    end
  end

  describe "Sale#find" do
    it "can find an instance of a sale by matching sale id" do
      FarMar::Sale.find(5).must_be_instance_of FarMar::Sale
    end
  end

end
