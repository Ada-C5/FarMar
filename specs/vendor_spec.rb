require_relative './spec_helper'

describe FarMar::Vendor do

	let(:all_vendors) {FarMar::Vendor.all}
	let(:vendor_test) {FarMar::Vendor.find(56)}
	let(:market_test) {FarMar::Vendor.by_market(56)}

	it "exists" do 
		FarMar::Vendor.wont_be_nil 
	end

	it "Find returns an instance of ::Vendor" do 
		vendor_test.must_be_instance_of FarMar::Vendor
	end

	it "Find returns a given vendor name" do 
		vendor_test.vendor_name.must_equal "Dibbert Inc"
	end

	it "Returns an array of vendors based on market ID" do
		vendor_test.get_markets.must_be_instance_of Array
	end 

	it "Returns an instance of ::Market" do
		vendor_test.get_markets[0].must_be_instance_of FarMar::Market
	end 

	it "Returns the market ID that a vendor visits" do
		vendor_test.get_markets[0].market_id.must_equal 13
	end

	it "Returns an instance of ::Product" do
		vendor_test.get_products[0].must_be_instance_of FarMar::Product
	end 

	it "Returns the vendor ID from a list of products" do
		vendor_test.get_products[0].vendor_id.must_equal 56
	end

	it "Returns the name of product(s) sold by a vendor" do 
		vendor_test.get_products[0].product_name.must_equal "Steep Honey"
		vendor_test.get_products[1].product_name.must_equal "Repulsive Greens"
	end

	it "Returns a list of sales based on vendor ID " do 
		vendor_test.get_sales[0].vendor_id.must_equal 56

	end 

	it "Raises an error if the sale does not exist" do 
		assert_raises(NoMethodError) {vendor_test.get_sales[3].vendor_id}
	end 

	it "Returns an amount of sales based on vendor ID" do 
		vendor_test.get_revenue.must_equal 13786
	end 

	it "by_market returns a list of vendors at a given market" do 
		market_test[0].market_id.must_equal 56
		market_test[1].market_id.must_equal 56
	end

	it "Raises an error if the vendor instance does not exist" do 
		assert_raises(NoMethodError) {market_test[15].market_id}
	end 
end 