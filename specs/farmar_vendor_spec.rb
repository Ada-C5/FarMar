require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Vendor do

# TEST 1
	it  "is an object we have access to" do
		FarMar::Vendor.wont_be_nil
	end

	it "returns a collection of instances representing all objects described in the CSV" do
		FarMar::Vendor.all.wont_be_nil
	end

	it "returns an instance of Vendor where the value of the id field in the CSV matches the passed parameter" do
		FarMar::Vendor.find(2690).wont_be_nil
	end



end
