require_relative './spec_helper'

describe FarMar::Product do

	let(:product_one) {FarMar::Product.new({id: "1", name: "Dry Beets", vendor_id: "1"})}

	it "has an 'all' method that returns an array of products" do
		products = FarMar::Product.all('./support/products.csv')
		products.wont_be_empty
	end

	it "populates each object with data from the CSV when #all is called" do
		products = FarMar::Product.all('./support/products.csv')
		product_to_test = rand(1..(products.length - 1))

		products[product_to_test].id.wont_be_empty
		products[product_to_test].name.wont_be_empty
	end

	it "returns the correct product when self#find is called" do
		FarMar::Product.find(5).name.must_equal("Green Apples")
	end

	it "returns nil when no product exists for specified id" do
		FarMar::Product.find(90180).must_be_nil
	end

	it "returns the correct vendor when the instance asks who sells it" do
		product_one.vendor.name.must_equal("Feil-Farrell")
	end

	it "returns a collection of associated FarMar::Sale using product_id field" do
		product_one.sales.length.must_equal()
	end

end