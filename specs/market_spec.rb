require_relative './spec_helper'

describe FarMar::Market do

	it "is an object we have access to" do 
		FarMar::Market.wont_be_nil 
	end

	it "Market.all is a class method" do 
		FarMar::Market.all.wont_be_nil
	end

	it "Market.all returns an array" do 
		assert_equal Array, FarMar::Market.all.class
	end

	it "Market.find(id) returns something" do 
		market = "Tamale Time"
		assert_equal market, FarMar::Market.find(market)
	end
end