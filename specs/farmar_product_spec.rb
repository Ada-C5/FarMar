require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Product do

	it  "is an object we have access to" do
		FarMar::Product.wont_be_nil
	end

	it "returns a collection of instances representing all objects described in the CSV" do
		FarMar::Product.all.wont_be_nil
	end

	it "returns an instance of Product where the value of the id field in the CSV matches the passed parameter" do
		FarMar::Product.find(10).wont_be_nil
	end

	it "returns the Vendor instance that is associated with this vendor using the Product vendor_id field" do
		product = FarMar::Product.find(1)
		assert_equal product.vendor.class, FarMar::Vendor
	end

	it "returns a collection of Sale instances that are associated using the Sale product_id field" do
		product = FarMar::Product.find(2)
		assert_equal product.sales.class, Array
	end

	it "returns the number of times this product has been sold" do
		product = FarMar::Product.find(1)
		assert_equal product.number_of_sales, 7
	end

	it "returns all of the products with the given vendor_id" do
		assert_equal FarMar::Product.by_vendor(1).class, Array
	end

end
