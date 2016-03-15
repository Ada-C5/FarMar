require_relative './spec_helper'

describe FarMar::Market do

	let(:all_markets) {FarMar::Market.all}
	let(:market_test) {FarMar::Market.find(56)}

	it "exists" do 
		FarMar::Market.wont_be_nil 
	end

	it "Market.all is not nil" do 
		all_markets.wont_be_nil
	end

	it "Market.all returns Array Class" do 
		assert_equal Array, all_markets.class
	end

	it "Market.find returns an instance of Market" do 
		assert_equal FarMar::Market, market_test.class
	end

	it "Find returns an instance of FarMar::Market" do 
		market_test.must_be_instance_of FarMar::Market
	end

	it "Find returns a given market name" do 
		market_test.market_name.must_equal "Carefree Farmers Market"
	end

	it "returns an instance of FarMar::Vendor" do
		market_test.get_vendors[0].must_be_instance_of FarMar::Vendor
	end 

	it "returns an array of vendors based on market ID" do
		market_test.get_vendors.must_be_instance_of Array
	end 

end


	# market.market_id_assert_equal 56
	# market.market_name_assert_equal "Carefree Farmers Market"
	# market.address_assert_equal "1 Sundial Circle"
	# market.city_assert_equal "Carefree"
	# market.county_assert_equal "Maricopa"
	# market.state_assert_equal "Arizona"
	# market.zip_code_assert_equal "85377"
