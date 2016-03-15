require_relative './spec_helper'

describe FarMar::Vendor do

	let(:all_vendors) {FarMar::Vendor.all}
	let(:vendor_test) {FarMar::Vendor.find(56)}

	it "exists" do 
		FarMar::Vendor.wont_be_nil 
	end

	it "Vendor.all is not nil" do 
		all_vendors.wont_be_nil
	end

	it "Vendor.all returns Array Class" do 
		assert_equal Array, all_vendors.class
	end

	it "Vendor.find returns an instance of Vendor" do 
		assert_equal FarMar::Vendor, vendor_test.class
	end

	it "Returns an instance of FarMar::Vendor" do 
		vendor_test.must_be_instance_of FarMar::Vendor
	end

	it "Find returns a given vendor name" do 
		vendor_test.vendor_name.must_equal "Dibbert Inc"
	end

	it "Returns an array of vendors based on market ID" do
		vendor_test.get_markets.must_be_instance_of Array
	end 

	it "Returns an instance of FarMar::Market" do
		vendor_test.get_markets[0].must_be_instance_of FarMar::Market
	end 

	it "Returns the ID of a market that a vendor visits" do
		vendor_test.get_markets[0].market_id.must_equal 13
	end

	it "Returns an instance of FarMar::Market" do
		vendor_test.get_products[0].must_be_instance_of FarMar::Product
	end 

	it "Returns the vendor ID from a list of products" do
		vendor_test.get_products[0].vendor_id.must_equal 56
	end

	it "Returns the name of a product(s) sold by a vendor" do 
		vendor_test.get_products[0].product_name.must_equal "Steep Honey"
		vendor_test.get_products[1].product_name.must_equal "Repulsive Greens"
		vendor_test.get_products[2].product_name.must_equal "Swift Carrots"
		vendor_test.get_products[3].product_name.must_equal "Homeless Pretzel"
		vendor_test.get_products[4].product_name.must_equal "Numerous Beets"
	end
end 