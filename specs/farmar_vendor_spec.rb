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

	it "returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field" do
		FarMar::Vendor.market(1).wont_be_nil
	end

	it "returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field" do
		assert_equal FarMar::Vendor.products(2), [["2", "Fierce Greens", "2"], ["3", "Heavy Chicken", "2"]]
	end

	#Vendor.market test

	#Vendor.products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.

	#Vendor.sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.

	# self.by_market(market_id): returns all of the vendors with the given market_id

	#revenue: returns the the sum of all of the vendor's sales (in cents)

end
