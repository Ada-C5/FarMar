require_relative './spec_helper'

describe FarMar::Vendor do

	it "is an object we have access to" do 
		FarMar::Vendor.wont_be_nil 
	end

	it "Vendor.all is a class method" do 
		FarMar::Vendor.all.wont_be_nil
	end

	it "Vendor.all returns an array" do 
		assert_equal Array, FarMar::Vendor.all.class
	end

	it "Vendor.find(id) returns something" do 
		vendor = "Tamale Tom"
		assert_equal market, FarMar::Vendor.find(vendor)
	end

end 