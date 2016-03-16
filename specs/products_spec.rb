require_relative "./spec_helper"
require_relative "../far_mar"


describe FarMar::Product do
	product171 = FarMar::Product.new(id: 171,
  								name: "Depressed Carrots", vendor_id: 54)
  	
  it "it is an object we have acccess to" do
    FarMar::Product.wont_be_nil
  end

  describe "Product#find" do
  	let (:product219) {FarMar::Product.find(219)}

  	it "checks that product219 is instance of an Array" do
  		product219.must_be_instance_of(Array)
  	end

  	it "returns nil for id numbers that don't exist" do
  		FarMar::Product.find(10_000).must_equal(nil)
  	end

  	it "checks the values of each variable for product219" do
  		product219[0].must_equal(219)
  		product219[1].must_equal("Strange Pretzel")
  		product219[2].must_equal(69)
  	end
  end

  describe "Product#all" do
  	let (:product) {FarMar::Product.all} 

  	it "Product should be instance of array" do
  		product.must_be_instance_of(Array)
  	end

  	it "Product should have 8193 entries" do
  		product.count.must_equal(8193)
  	end

  	it "should return array full of instances" do
  		classes = product.map{|m| m.class}
  		classes.uniq.must_equal([FarMar::Product])
  	end
  end

  describe "Product#vendor,sales" do
  	it "should return an array of vendors" do
  		product171.vendor.must_be_instance_of(FarMar::Vendor)
  		product171.sales.must_be_instance_of(Array)
  	end

  	it "should return vendor count for a market" do
  		product171.sales.count.must_equal(3)
  		product171.vendor.id.must_equal(54)
  	end
  end

  describe "Product#number_of_sales" do
  	it "should return the # of sales for a product" do
  		product171.number_of_sales.must_equal(3)
  	end
  end

  describe "Product#by_vendor(vendor_id)" do
  	it "should return count of products for a vendor" do
  		FarMar::Product.by_vendor(5).count.must_equal(3)
  	end
  end
end