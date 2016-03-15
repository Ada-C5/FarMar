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

      it "should return information for particular sale" do
        selected_sale = FarMar::Sale.find(78)
        selected_sale.product_info.must_equal "44"
      end
end
