require_relative './spec_helper'

describe FarMar::Sale do
  it "is an object that I have access to" do
    FarMar::Sale.wont_be_nil
  end

  describe "FarMar::Sale class methods" do
    let(:sale_ten) { FarMar::Sale.find(10) }

    it "should return an instance of array using self.all method" do
      FarMar::Sale.all.must_be_instance_of Array
    end

    it "should return a specific instance of FarMar::Sale using the self.find method" do
      sale_ten.must_be_instance_of FarMar::Sale
      sale_ten.id.must_equal 10
      sale_ten.amount.must_equal 5160
    end
  end
end