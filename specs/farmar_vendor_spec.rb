require_relative './spec_helper'

describe FarMar::Vendor do

	before do
		@test_vendor = FarMar::Vendor.find(1)[0]
	end

	it "FarMar::Vendor Class Exists" do
		FarMar::Vendor.wont_be_nil
	end

	describe "self.all" do
		it "exists" do
			FarMar::Vendor.all.wont_be_nil
		end

		it "returns an array" do
			FarMar::Vendor.all.must_be_instance_of Array
		end

		it "returns an array of FarMar::Vendors instances" do
			FarMar::Vendor.all[1].must_be_instance_of FarMar::Vendor
		end
	end

	describe "self.find" do
		it "exists" do
			FarMar::Vendor.find(1).wont_be_nil
		end

		it "returns an instance of FarMar::Vendor when given a valid id" do
			@test_vendor.must_be_instance_of FarMar::Vendor
		end

		it "returns [] when given an invalid id" do
			FarMar::Vendor.find(9999999).must_equal []
		end

		it "returns the correct instance when given a valid id" do
			@test_vendor.name.must_equal "Feil-Farrell"
		end
	end

	describe "self.by_market(market_id)" do
		it "returns all of the vendors with the given market_id" do
			FarMar::Vendor.by_market(1).length.must_equal 6
		end
	end

	describe "market method" do
		it "returns the correct FarMar::Market instance" do
			@test_vendor.market[0].city.must_equal "Portland"
		end
	end

	describe "products method" do
		it "returns the correct number of FarMar::Product instances" do
			@test_vendor.products.length.must_equal 1
		end
	end

	describe "sales method" do
		it "returns the correct number of FarMar::Sale instances" do
			@test_vendor.sales.length.must_equal 7
		end
	end

	describe "revenue method" do
		it "returns a fixnum" do
			@test_vendor.revenue.must_be_instance_of Fixnum
		end

		it "returns the correct revenue amount for a vendor" do
			@test_vendor.revenue.must_equal 38259
		end
	end

end
