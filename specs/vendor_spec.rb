require_relative './spec_helper'

describe FarMar::Vendor do 

	it "exists" do
		FarMar::Vendor.wont_be_nil
	end

	it "has an 'all' method that returns an array of vendors" do
		vendors = FarMar::Vendor.all('./support/vendors.csv')
		vendors.wont_be_empty
	end

	it "populates each object with data from the CSV when #all is called" do
		vendors = FarMar::Vendor.all('./support/vendors.csv')
		vendor_to_test = rand(1..(vendors.length - 1))

		vendors[vendor_to_test].id.wont_be_empty
		vendors[vendor_to_test].name.wont_be_empty
	end

	it "returns the correct sale when self#find is called" do
		FarMar::Vendor.find(18).name.must_equal("Von-Hamill")
	end

	it "has a market method that will return the market this vendor is associated with" do 
		vendor_to_test = FarMar::Vendor.new({id: "1", name: "Feil-Farrell", num_of_employees: "8", market_id: "1"})
		market = vendor_to_test.market

		market.name.must_equal("People's Co-op Farmers Market")
		market.id.must_equal("1")
	end

	it "has a market method that will return nil if no market is found" do
		# using numbers I know don't currently exist to test the case of not finding a market.
		vendor_to_test = FarMar::Vendor.new({id: "90180", market_id: "10000"})
		market = vendor_to_test.market

		market.must_be_nil
	end

	it "has a products method" do
		vendor_to_test = FarMar::Vendor.new({id: "1", name: "Feil-Farrell", num_of_employees: "8", market_id: "1"})

		vendor_to_test.must_respond_to(:products)
	end

end