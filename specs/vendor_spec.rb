require_relative "./spec_helper"
require_relative "../far_mar"
#require_relative "../farmar_vendor"

describe FarMar::Vendor do
  it "it is an object we have acccess to" do
    FarMar::Vendor.wont_be_nil
    end
  end

  describe "FarMar#Vendor" do

    before do
      vendor_data = {
      vendor_id: 92,
      name: "Gary",
      no_of_employees: 7
      }
      @vendor = FarMar::Vendor.new(vendor_data)
    end

    it "an instance of class Vendor'" do
    	@vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "should return number of all vendors" do
      all_vendors = FarMar::Vendor.all
      all_vendors.length.must_equal 2690
    end

    it "should return information for particular vendor" do
        selected_vendor = FarMar::Vendor.find(77)
        selected_vendor.no_of_employees.must_equal 10
    end

    it "should return an array for market" do
      one_market = FarMar::Vendor.find(77)
      one_market.market.must_be_instance_of Array
    end

    it "should return information for particular product" do
      selected_vendor = FarMar::Vendor.find(77)
      selected_vendor.products[0].product_name.must_equal "Harsh Greens"
    end

    it "should return information for particular sale" do
      selected_vendor = FarMar::Vendor.find(77)
      selected_vendor.sales[0].amount.must_equal 5365
    end

end
