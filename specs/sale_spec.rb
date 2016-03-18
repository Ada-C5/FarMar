require_relative './spec_helper'

describe FarMar::Sale do
	let(:all_sales) {FarMar::Sale.all}
	let(:sale_test) {FarMar::Sale.find(10)}

	it "exists" do 
		FarMar::Sale.wont_be_nil 
	end

	it "Sale.all is not nil" do 
		all_sales.wont_be_nil
	end

	it "Sale.find returns an instance of sale" do 
		assert_equal FarMar::Sale, sale_test.class
	end

	it "Returns an instance of ::Sale" do 
		sale_test.must_be_instance_of FarMar::Sale
	end

	it "Find returns a vendor ID when given a sale ID" do 
		sale_test.vendor_id.must_equal 3
	end

	it "Returns an instance of ::Vendor" do
		sale_test.get_vendors[0].must_be_instance_of FarMar::Vendor
	end 

	it "Returns vendor ID based on product ID from ::Vendor" do
		sale_test.get_vendors[0].vendor_id.must_equal 3
	end

	it "Returns an instance of ::Product" do
		sale_test.get_products[0].must_be_instance_of FarMar::Product
	end 

	it "Returns the vendor ID from a list of products" do
		sale_test.get_products[0].vendor_id.must_equal 3
	end

	it "Returns the product ID from ::Vendor" do 
		sale_test.get_products[0].product_id.must_equal 4
	end

	it "returns a list of sales found between two DateTimes" do 
		beginning_time = "2013-11-07 00:12:29 -0800"
		end_time = "2013-11-07 00:21:48 -0800"
		sales = FarMar::Sale.between(beginning_time, end_time)
		sales.length.must_equal 11
	end
	
	it "returns an empty array and error if no sales found" do 
		beginning_time = "2016-01-07 00:12:29 -0800"
		end_time = "2016-01-10 01:21:48 -0800"
		sales = FarMar::Sale.between(beginning_time, end_time)
		sales.length.must_equal 0
	end
end