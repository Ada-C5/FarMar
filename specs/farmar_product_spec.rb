require_relative './spec_helper'

describe FarMar::Product do

	before do
		@test_market = FarMar::Market.find(1)
		@test_product = FarMar::Product.find(1)
	end

	describe "self.all" do
		it "returns an array" do
			FarMar::Product.all.must_be_instance_of Array
		end

		it "returns an array of FarMar::Products instances" do
			FarMar::Product.all[1].must_be_instance_of FarMar::Product
		end
	end

	describe "self.find" do
		it "returns an instance of FarMar::Product when given a valid id" do
			@test_product.must_be_instance_of FarMar::Product
		end

		it "returns nil when given an invalid id" do
			FarMar::Product.find(9999999).must_equal nil
		end

		it "returns the correct instance when given a valid id" do
			@test_product.name.must_equal "Dry Beets"
		end
	end

	describe "self.by_vendor(vendor_id)" do
		it "returns an array" do
			FarMar::Product.by_vendor(1).must_be_instance_of Array
		end

		it "returns an array with an instances of FarMar::Product" do
			FarMar::Product.by_vendor(1)[0].must_be_instance_of FarMar::Product
		end

		it "returns the correct vendor information" do
			FarMar::Product.by_vendor(1)[0].name.must_equal "Dry Beets"
		end
	end

	describe "vendor method" do
		it "will return the correct vendor of a product" do
			@test_product.vendor.name.must_equal "Feil-Farrell"
		end
	end

	describe "sales method" do
		it "will return an array of FarMar::Sales instances" do
			@test_product.sales[0].must_be_instance_of FarMar::Sale
		end
	end

	describe "number_of_sales method" do
		it "will return the number of sales for a given product" do
			@test_product.number_of_sales.must_equal 7
		end
	end

end
