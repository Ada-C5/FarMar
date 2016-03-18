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

	 it "returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field" do
		 vendor = FarMar::Vendor.find(1)
	 	assert_equal vendor.products.class, Array
	 end

	#Vender.market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
	it "returns the Market instance that is associated with this vendor using the Vendor market_id" do
		vendor = FarMar::Vendor.find(1)
		assert_equal vendor.market.class, FarMar::Market
	end

	#Vendor.products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
	it "returns a collection of Product instances that are associated by the Product vendor_id" do
		vendor = FarMar::Vendor.find(1)
		assert_equal vendor.products.class, Array
	end

	#Vendor.sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
	it "returns a collection of Sale instances that are associated by the vendor_id" do
		vendor = FarMar::Vendor.find(1)
		assert_equal vendor.sales.class, Array
	end

	# self.by_market(market_id): returns all of the vendors with the given market_id
	it "returns all of the vendor with the given market_id" do
		assert_equal FarMar::Vendor.by_market(1).class, FarMar::Vendor
	end

	#revenue: returns the the sum of all of the vendor's sales (in cents)
	it "returns the sum of all of the vendor's sales" do
		vendor = FarMar::Vendor.find(1)
		assert_equal vendor.revenue.class, Float
	end

end
