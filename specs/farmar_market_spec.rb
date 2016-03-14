require_relative './spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_market'

describe FarMar::Market do
	it "FarMar::Market Class Exists" do
		FarMar::Market.wont_be_nil
	end

	it "Will create an instance of FarMar::Market" do
		test_hash = {}
		sample = FarMar::Market.new(test_hash)
		sample.wont_be_nil
	end

end
