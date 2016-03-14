require_relative './spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_sale'

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
