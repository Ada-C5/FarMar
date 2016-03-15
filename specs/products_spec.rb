require_relative "./spec_helper"
require_relative "../far_mar"


describe FarMar::Product do
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
end