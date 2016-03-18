require_relative './spec_helper'

describe FarMar::Sale do

  SALE_TEST = [1, 3, Time.new, 2, 4] #sid, amount, time, vid, pid
  let(:transaction) {FarMar::Sale.new(SALE_TEST)}
  describe "Sale new" do
    it "can create new instances of Sale with correct amount" do
      transaction.amount.must_equal 3
    end
  end

  describe "Sale find" do
    it "can find an instance of a sale by matching sale id" do
      FarMar::Sale.find(5).must_be_instance_of FarMar::Sale
    end
    it "will return nil if no instance found" do
      FarMar::Sale.find(333333).must_equal "No instance found"
    end
  end

  describe "Sale#vendor" do
    it "can find an instance of a vendor matching sale instance referenced" do
      transaction.vendor.must_be_instance_of FarMar::Vendor
    end
  end

  describe "Sale#product" do
    it "can find an instance of a product matching sale instance referenced" do
      transaction.product.must_be_instance_of FarMar::Product
    end
  end

  describe "Sale between" do
    it "can find a collection of instances whose purchase time is between two passed times" do
      FarMar::Sale.between("11/8/2013", "11/8/2013").must_be_instance_of Array
    end
  end

end
