require_relative './spec_helper'

describe FarMar::Product do 

	it "is an object we have access to" do 
		FarMar::Product.wont_be_nil 
	end

	it "Product.all is a class method" do 
		FarMar::Product.all.wont_be_nil
	end

	it "Product.all returns an array" do 
		assert_equal Array, FarMar::Product.all.class
	end

	it "Product.find(id) returns something" do 
		product = "Tamales"
		assert_equal market, FarMar::Product.find(product)
	end

end