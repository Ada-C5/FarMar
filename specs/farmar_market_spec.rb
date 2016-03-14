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

end
