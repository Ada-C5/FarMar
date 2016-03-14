require_relative './spec_helper'

describe FarMar::Sale do
	it "FarMar::Sale Class Exists" do
		FarMar::Sale.wont_be_nil
	end

	it "Will create an instance of FarMar::Sale" do
		test_hash = {}
		sample = FarMar::Sale.new(test_hash)
		sample.wont_be_nil
	end

end
