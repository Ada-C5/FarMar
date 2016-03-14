require_relative './spec_helper'

describe FarMar::Product do 

	it "exists" do
		FarMar::Product.wont_be_nil
	end

	it "has an 'all' method that returns an array of products" do
		products = FarMar::Product.all('./support/products.csv')
		products.wont_be_empty
	end

	it "populates each object with data from the CSV when #all is called" do
		products = FarMar::Product.all('./support/products.csv')
		product_to_test = rand(1..(products.length - 1))

		products[product_to_test].id.wont_be_empty
		products[product_to_test].name.wont_be_empty
	end

	it "has a find method" do
		FarMar::Product.find('./support/products.csv').wont_be_nil
	end

	it "returns the correct market when self#find is called" do
		FarMar::Product.find(5).name.must_equal("Green Apples")
	end

end