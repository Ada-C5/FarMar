require_relative './spec_helper'

describe FarMar::Product do
	it "FarMar::Product Class Exists" do
		FarMar::Product.wont_be_nil
	end

	it "Will create an instance of FarMar::Product" do
		test_hash = {}
		sample = FarMar::Product.new(test_hash)
		sample.wont_be_nil
	end

end
