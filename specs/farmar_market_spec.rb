require_relative './spec_helper'

describe FarMar::Market do
	before do
		@test_market = FarMar::Market.find(1)
	end

	it "FarMar::Market Class Exists" do
		FarMar::Market.wont_be_nil
	end

	it "Instances of FarMar::Market Exist" do
		test_hash = {}
		sample = FarMar::Market.new(test_hash)
		sample.wont_be_nil
	end

	describe "self.all" do
		it "exists" do
			FarMar::Market.all.wont_be_nil
		end

		it "returns an array" do
			FarMar::Market.all.must_be_instance_of Array
		end

		it "returns an array of FarMar::Markets instances" do
			FarMar::Market.all[1].must_be_instance_of FarMar::Market
		end
	end

	describe "self.find" do
		it "exists" do
			FarMar::Market.find(1).wont_be_nil
		end

		it "returns an instance of FarMar::Market when given a valid id" do
			@test_market.must_be_instance_of FarMar::Market
		end

		it "returns [] when given an invalid id" do
			FarMar::Market.find(9999999).must_equal nil
		end

		it "returns the correct instance when given a valid id" do
			@test_market.city.must_equal "Portland"
		end
	end

	describe "vendors method" do
		it "exists" do
			@test_market.vendors.wont_be_nil
		end

		it "returns an array" do
			@test_market.vendors.must_be_instance_of Array
		end

		it "returns an array containing FarMar::Vendor instance(s)" do
			@test_market.vendors[0].must_be_instance_of FarMar::Vendor
		end

		it "returns the correct instances of FarMar::Vendor" do
			FarMar::Market.find(30).name.must_equal "Grafton Farmers Market"
		end
	end

end
