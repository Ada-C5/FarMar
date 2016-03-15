require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Sale do
  it "is an object that isn't empty" do
    FarMar::Sale.wont_be_nil
  end

  describe "FarMar::Sale#self.all" do
    it "should return an array with all vendors" do
      FarMar::Sale.all.must_be_instance_of Array
    end

    it "should return an array with all 12798 vendors" do
      FarMar::Sale.all.length.must_equal 12798
    end
  end

  describe "FarMar::Sale#self.find" do
    it "should return object's sale ammount equal to 9376" do
      FarMar::Sale.find("2676").ammount.must_equal 9376
    end

    it "should return an object of the class Sale" do
      FarMar::Sale.find("1142").must_be_instance_of FarMar::Sale
    end

  end
end
