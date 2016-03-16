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

	it "Sale.all returns Array Class" do 
		assert_equal Array, all_sales.class
	end

	it "Sale.find returns an instance of sale" do 
		assert_equal FarMar::Sale, sale_test.class
	end

	it "Returns an instance of FarMar::Sale" do 
		sale_test.must_be_instance_of FarMar::Sale
	end

	it "Find returns a vendor ID when given a sale ID" do 
		sale_test.vendor_id.must_equal 3
	end
end