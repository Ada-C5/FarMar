require_relative './spec_helper'

describe FarMar::Product do 

	let(:all_products) {FarMar::Product.all}
	let(:product_test) {FarMar::Product.find(35)}
	let(:vendor_test) {FarMar::Product.by_vendor(35)}

	it "exists" do 
		FarMar::Product.wont_be_nil 
	end

	it "Product.all is not nil" do 
		all_products.wont_be_nil
	end

	it "Returns an instance of FarMar::Product" do 
		product_test.must_be_instance_of FarMar::Product
	end

	it "Find returns a given product name" do 
		product_test.product_name.must_equal "Massive Apples"
	end

	it "Returns an instance of ::Vendor" do
		product_test.get_vendors[0].must_be_instance_of FarMar::Vendor
	end 

	it "Returns vendor ID based on product ID from ::Vendor" do
		product_test.get_vendors[0].vendor_id.must_equal 12
	end

	it "Returns an instance of ::Sale" do
		product_test.get_sales[0].must_be_instance_of FarMar::Sale
	end 

	it "Returns the product ID from a list of sales" do
		product_test.get_sales[0].vendor_id.must_equal 12
	end

	it "Returns vendor ID based on product ID from ::Sale" do
		product_test.get_sales[0].vendor_id.must_equal 12 
	end

	it "Returns the total times a product sold from ::Sale" do 
		product_test.get_number_of_sales.must_equal 1
	end 

	it "by_vendor returns products associated with vendor ID" do 
		vendor_test.must_equal 4
	end
end