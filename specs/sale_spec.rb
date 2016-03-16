require_relative './spec_helper'

describe FarMar::Sale do 


	it "has an 'all' method that returns an array of sales" do
		sales = FarMar::Sale.all('./support/sales.csv')
		sales.wont_be_empty
	end

	it "populates each object with data from the CSV when #all is called" do
		sales = FarMar::Sale.all('./support/sales.csv')
		sale_to_test = rand(1..(sales.length - 1))

		sales[sale_to_test].id.wont_be_empty
		sales[sale_to_test].amount.wont_be_empty
	end

	it "has a find method" do
		FarMar::Sale.must_respond_to(:find)
	end

	it "returns the correct sale when self#find is called" do
		FarMar::Sale.find(50).amount.must_equal("5420")
	end

end