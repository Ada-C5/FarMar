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

  describe "FarMar::Vendor#vendor(vendor_id)" do
    let(:sale_test) { FarMar::Sale.new("11888","7328.0","2013-11-12 02:22:44 -0800","2665","8113") }

    it "returns an ARRAY with all of the products with the given vendor_id" do
      sale_test.vendor.must_be_instance_of FarMar::Vendor
    end

    it "should return to one instance of Vendor class, and all its info" do
      sale_test.vendor.vendor_id.must_equal 2665
      sale_test.vendor.vendor_name.must_equal "Morissette Group"
      sale_test.vendor.num_employees.must_equal "3"
      sale_test.vendor.market_id.must_equal 495

    end


  end
end
