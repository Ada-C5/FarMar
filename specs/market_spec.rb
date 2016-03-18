require_relative './spec_helper'

describe FarMar::Market do

	let(:all_markets) {FarMar::Market.all}
	let(:market_test) {FarMar::Market.find(56)}

	it "exists" do 
		FarMar::Market.wont_be_nil 
	end

	it "Market.all is not nil" do 
		all_markets.wont_be_nil
	end

	it "Find returns an instance of ::Market" do 
		market_test.must_be_instance_of FarMar::Market
	end

	it "Find returns a given market name" do 
		market_test.market_name.must_equal "Carefree Farmers Market"
	end

	it "returns an array of vendors based on market ID" do
		market_test.get_vendors.must_be_instance_of Array
	end 

	it "returns an instance of ::Vendor" do
		market_test.get_vendors[0].must_be_instance_of FarMar::Vendor
	end 

	it "Returns a vendor name when given a market ID" do
		market_test.get_vendors[5].vendor_name.must_equal "Rippin-Nader"
	end
end

