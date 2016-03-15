require_relative './spec_helper'

describe FarMar::Product do 

	let(:all_products) {FarMar::Product.all}
	let(:product_test) {FarMar::Product.find(56)}

	it "exists" do 
		FarMar::Product.wont_be_nil 
	end

	it "Product.all is not nil" do 
		all_products.wont_be_nil
	end

	it "Product.all returns Array Class" do 
		assert_equal Array, all_products.class
	end

	it "Product.find returns an instance of Product" do 
		assert_equal FarMar::Product, product_test.class
	end

	it "Returns an instance of FarMar::Product" do 
		product_test.must_be_instance_of FarMar::Product
	end

	it "Find returns a given vendor name" do 
		product_test.product_name.must_equal "Nom nom Beef"
	end


end