require_relative './spec_helper'

describe FarMar::Sale do
	it "is an object we have access to" do 
		FarMar::Sale.wont_be_nil 
	end

	it "Sale.all is a class method" do 
		FarMar::Sale.all.wont_be_nil
	end

	it "Sale.all returns an array" do 
		assert_equal Array, FarMar::Sale.all.class
	end

	it "Sale.find(id) returns a value" do 
		sales = "Dollars"
		assert_equal sales, FarMar::Sale.find(sales)
	end
end