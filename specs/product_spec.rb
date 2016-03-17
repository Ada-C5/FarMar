require_relative './spec_helper'

describe FarMar::Product do 

	let(:all_products) {FarMar::Product.all}
	let(:product_test) {FarMar::Product.find(56)}
	let(:vendor_test) {FarMar::Product.by_vendor(56)}

	it "exists" do 
		FarMar::Product.wont_be_nil 
	end

	it "Product.all is not nil" do 
		all_products.wont_be_nil
	end

	it "Product.all returns Array Class" do 
		assert_equal Array, all_products.class
	end

	it "Returns an instance of FarMar::Product" do 
		product_test.must_be_instance_of FarMar::Product
	end

	it "Find returns a given product name" do 
		product_test.product_name.must_equal "Nom nom Beef"
	end

	#vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
	#sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
	#number_of_sales: returns the number of times this product has been sold.
	#self.by_vendor(vendor_id): returns all of the products with the given vendor_id

end