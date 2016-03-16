require_relative './spec_helper'

describe FarMar::Product do

	let(:product_one) {FarMar::Product.new({id: "1", name: "Dry Beets", vendor_id: "1"})}
	let(:product_two) {FarMar::Product.new({id: "190283"})}

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
		product_one.sales.length.must_equal(7)
	end

	it "returns an empty collection if #sales is called on a vendor with no sales" do
		product_two.sales.must_be_empty
		product_two.sales.must_be_instance_of(Array)
	end

	it "returns a count of how many times this item has been sold" do
		product_one.number_of_sales.must_equal(7)
	end

	it "returns 0 if this item has never been sold" do
		product_two.number_of_sales.must_equal(0)
	end

	it "returns a collection of the products with given vendor id" do
		FarMar::Product.by_vendor("2").must_equal(2)
		FarMar::Product.by_vendor.must_be_instance_of(Array)
		FarMar::Product.by_vendor[0].must_equal("Fierce Greens")
	end

	it "returns an empty collection when a product has a non-valid vendor id" do
		FarMar::Product.by_vendor(2691).must_be_empty
		FarMar::Product.by_vendor(2691).must_be_instance_of(Array)
	end

end