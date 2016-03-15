require_relative './spec_helper'

describe FarMar::Vendor do 

	it "exists" do
		FarMar::Vendor.wont_be_nil
	end

	it "has an 'all' method that returns an array of vendors" do
		vendors = FarMar::Vendor.all('./support/vendors.csv')
		vendors.wont_be_empty
	end

	it "populates each object with data from the CSV when #all is called" do
		vendors = FarMar::Vendor.all('./support/vendors.csv')
		vendor_to_test = rand(1..(vendors.length - 1))

		vendors[vendor_to_test].id.wont_be_empty
		vendors[vendor_to_test].name.wont_be_empty
	end

	it "has a find method" do
		FarMar::Vendor.must_respond_to(:find)
	end

	it "returns the correct sale when self#find is called" do
		FarMar::Vendor.find(18).name.must_equal("Von-Hamill")
	end



end