require_relative './spec_helper'

describe FarMar::Sale do 

	let(:sale_one) {FarMar::Sale.new({id: "1", amount: "9290", purchase_time: "2013-11-07 04:34:56 -0800", vendor_id: "1", product_id: "1"})}
	let(:sale_two) {FarMar::Sale.new({id: "12002", amount: "8923", vendor_id: "2691", product_id: "8197"})}

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

	it "responds to the vendor method call" do
		sale_one.must_respond_to(:vendor)
	end

	it "returns the vendor associated with this sale" do
		sale_one.vendor.id.must_equal("1")
		sale_one.vendor.name.must_equal("Feil-Farrell")
	end

	#skipped for now, will address in refactor of Vendor#find
	it "returns nil if no vendor is found" do
		skip
		sale_two.vendor.must_be_nil
	end

	it "responds to the product method call" do
		sale_one.must_respond_to(:product)
	end

	it "returns the right product when #product is called" do
		sale_one.product.name.must_equal("Dry Beets")
		sale_one.product.id.must_equal("1")
	end

	# skipped for now, will address in refactor of Product#find
	it "returns nil if no product is found" do
		skip
		sale_two.product.must_be_nil
	end

	it "responds to calls on self#between" do
		FarMar::Sale.must_respond_to(:between)
	end

end 