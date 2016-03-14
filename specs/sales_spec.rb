require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Sales do
  it "is an object that isn't empty" do
    FarMar::Sales.wont_be_nil
  end

  describe "FarMar::Sales#self.all" do
    it "should return an array with all vendors" do
      FarMar::Sales.all.must_be_instance_of Array
    end

    it "should return an array with all 12798 vendors" do
      FarMar::Sales.all.length.must_equal 12798
    end
  end

  describe "FarMar::Sales#self.find" do
    it "should return object's sale ammount equal to 9376" do
      FarMar::Sales.find("2676").ammount.must_equal 9376
    end

    it "should return an object of the class Sales" do
      FarMar::Sales.find("1142").must_be_instance_of FarMar::Sales
    end

  end
end
