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




end
