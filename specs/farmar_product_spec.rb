require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Product do

# TEST 1
	it  "is an object we have access to" do
		FarMar::Product.wont_be_nil
	end

	it "returns a collection of instances representing all objects described in the CSV" do
		FarMar::Product.all.wont_be_nil
	end

	it "returns an instance of Product where the value of the id field in the CSV matches the passed parameter" do
		FarMar::Product.find(10).wont_be_nil
	end

	  #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field

		  #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.

			#number_of_sales: returns the number of times this product has been sold.

			# self.by_vendor(vendor_id): returns all of the productsvendors with the given vendormarket_id

end
