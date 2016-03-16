require_relative './spec_helper'

describe FarMar::Sale do 

	let(:sale_one) {FarMar::Sale.new({id: "1", amount: "9290", purchase_time: "2013-11-07 04:34:56 -0800", vendor_id: "1", product_id: "1"})}

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

	it "has a method that returns all the sales for a vendor" do
		sale_one.must_respond_to(:vendor)
	end

end