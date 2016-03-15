require_relative "./spec_helper"
require_relative "../far_mar"


describe FarMar::Sale do
  it "it is an object we have acccess to" do
    FarMar::Sale.wont_be_nil
  end

    describe "Sale#find" do
  	let (:sale311) {FarMar::Sale.find(311)}

  	it "checks that sale311 is instance of an Array" do
  		sale311.must_be_instance_of(Array)
  	end

  	it "returns nil for id numbers that don't exist" do
  		FarMar::Sale.find(1000_000).must_equal(nil)
  	end

  	it "checks the values of each variable for sale311" do
  		sale311[0].must_equal(311)
  		sale311[1].must_equal(3520)
  		#sale311[2].must_equal("2013-11-08 20:36:34 -0800")
  		sale311[3].must_equal(69)
  		sale311[4].must_equal(219)
  	end
  end

  describe "sale#all" do
  	let (:sale) {FarMar::Sale.all} 

  	it "sale should be instance of array" do
  		sale.must_be_instance_of(Array)
  	end

  	it "sale should have 12798 entries" do
  		sale.count.must_equal(12798)
  	end

  	it "should return array full of instances" do
  		classes = sale.map{|m| m.class}
  		classes.uniq.must_equal([FarMar::Sale])
  	end
  end
end