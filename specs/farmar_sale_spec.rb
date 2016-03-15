require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Sale do

# TEST 1
	it  "is an object we have access to" do
		FarMar::Sale.wont_be_nil
	end

	it "returns a collection of instances representing all objects described in the CSV" do
		FarMar::Sale.all.wont_be_nil
	end

	it "returns an instance of Sale where the value of the id field in the CSV matches the passed parameter" do
		FarMar::Sale.find(10).wont_be_nil
	end

	  #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field

		#product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field

		# self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments

end
