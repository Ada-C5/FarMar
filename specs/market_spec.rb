require_relative './spec_helper'

describe FarMar::Market do 

	it "exists" do
		FarMar::Market.wont_be_nil
	end

	it "has an 'all' method that returns an array of markets" do
		markets = FarMar::Market.all('./support/markets.csv')
		markets.wont_be_empty
	end

	it "" do
				
	end

end