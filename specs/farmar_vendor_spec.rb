require_relative './spec_helper'

describe FarMar::Vendor do
	it "FarMar::Vendor Class Exists" do
		FarMar::Vendor.wont_be_nil
	end

	it "Will create an instance of FarMar::Vendor" do
		test_hash = {}
		sample = FarMar::Vendor.new(test_hash)
		sample.wont_be_nil
	end

end
