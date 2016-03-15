require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Market do

# TEST 1
	it  "is an object we have access to" do
		FarMar::Market.wont_be_nil
	end

	it "returns a collection of instances representing all objects described in the CSV" do
		FarMar::Market.all.wont_be_nil
	end

	it "returns an instance of Market where the value of the id field in the CSV matches the passed parameter" do
		FarMar::Market.find(10).wont_be_nil
	end

	it "returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field" do
		assert_equal FarMar::Market.vendors(1), [["1", "Feil-Farrell", "8", "1"], ["2", "Hamill, Kilback and Pfeffer", "5", "1"], ["3", "Breitenberg Inc", "5", "1"], ["4", "Kris and Sons", "5", "1"], ["5", "Reynolds, Schmitt and Klocko", "3", "1"], ["6", "Zulauf and Sons", "8", "1"]]
	end

	#Market.vendors test


end
