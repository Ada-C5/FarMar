require_relative './spec_helper'

describe FarMar::Market do

	it "FarMar::Market Class Exists" do
		FarMar::Market.wont_be_nil
	end

	it "Will create an instance of FarMar::Market" do
		test_hash = {}
		sample = FarMar::Market.new(test_hash)
		sample.wont_be_nil
	end

	describe "#all" do
		it "returns an array" do
			FarMar::Market.all.must_be_instance_of String
		end
	end
end
