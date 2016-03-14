require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Sale do

# TEST 1
	it  "is an object we have access to" do
		FarMar::Sale.wont_be_nil
	end

	it "returns a collection of instances representing all objects described in the CSV" do
		FarMar::Sale.all.wont_be_nil
	end

	it "returns an instance of Sale where the value of the id field in the CSV matches the passed parameter" do
		FarMar::Sale.find(10).wont_be_nil
	end

end
