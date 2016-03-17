require_relative './spec_helper'

describe FarMar::Vendor do
	it "FarMar::Vendor Class Exists" do
		FarMar::Vendor.wont_be_nil
	end

#EDIT .all and .find so its relevant to vendor
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
			FarMar::Market.find(9999999).must_equal []
		end

		it "returns the correct instance when given a valid id" do
			@test_market.city.must_equal "Portland"
		end
	end
	# 
	# describe "self.by_market(market_id)" do
	# 	XXX
	# end
	#
	# describe "market method" do
	# 	XXX
	# end
	#
	# describe "products method" do
	# 	XXX
	# end
	#
	# describe "sales method" do
	# 	XXX
	# end
	#
	# describe "revenue method" do
	# 	XXX
	# end
end
