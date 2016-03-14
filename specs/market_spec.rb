require_relative './spec_helper'

describe FarMar::Market do 

	it "exists" do
		FarMar::Market.wont_be_nil
	end

	it "has an 'all' method that returns an array of markets" do
		markets = FarMar::Market.all('./support/markets.csv')
		markets.wont_be_empty
	end

	it "populates each object with data from the CSV when #all is called" do
		markets = FarMar::Market.all('./support/markets.csv')
		market_to_test = rand(1..(markets.length - 1))

		markets[market_to_test].id.wont_be_empty
		markets[market_to_test].name.wont_be_empty
	end

end