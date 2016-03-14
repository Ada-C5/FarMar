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

	it "has a find method" do
		FarMar::Market.find('./support/markets.csv').wont_be_nil
	end

	it "returns the correct market when self#find is called" do
		FarMar::Market.find(12).name.must_equal("Coxsackie Farmers' Market")
	end

	it "has a vendors method" do
		market = FarMar::Market.new(id: 8)

		market.must_respond_to(:vendors)

	end

end