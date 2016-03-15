require_relative './spec_helper'

describe FarMar::Vendor do

	let(:all_vendors) {FarMar::Vendor.all}
	let(:vendor) {FarMar::Vendor.find(56)}

	it "exists" do 
		FarMar::Vendor.wont_be_nil 
	end

	it "Vendor.all is not nil" do 
		all_vendors.wont_be_nil
	end

	it "Vendor.all returns Array Class" do 
		assert_equal Array, all_vendors.class
	end

	it "Vendor.find returns an instance of Vendor" do 
		assert_equal FarMar::Vendor, vendor.class
	end

	it "Returns an instance of FarMar::Vendor" do 
		vendor.must_be_instance_of FarMar::Vendor
	end

end 