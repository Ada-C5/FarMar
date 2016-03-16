require_relative "./spec_helper"
require_relative "../far_mar"


describe FarMar::Vendor do
	vendor54 = FarMar::Vendor.new(id: 54, name: "Bayer Inc",
  						no_of_employees: 3, market_id:13)

  it "it is an object we have acccess to" do
    FarMar::Vendor.wont_be_nil
  end

  describe "Vendor#find" do
  	let (:vendor69) {FarMar::Vendor.find(69)}

  	it "checks that Vendor69 is instance of an array" do
  		vendor69.must_be_instance_of(Array)
  	end

  	it "returns nil for id numbers that don't exist" do
  		FarMar::Vendor.find(10_000).must_equal(nil)
  	end

  	it "checks the values of each variable for Vendor69" do
  		vendor69[0].must_equal(69)
  		vendor69[1].must_equal("Emard-Streich")
  		vendor69[2].must_equal(5)
  		vendor69[3].must_equal(15)
  	end
  end

  describe "Vendor#all" do
  	let (:vendor) {FarMar::Vendor.all} 

  	it "Vendor should be instance of array" do
  		vendor.must_be_instance_of(Array)
  	end

  	it "Vendor should have 2690 entries" do
  		vendor.count.must_equal(2690)
  	end

  	it "should return the class" do
  		classes = vendor.map{|m| m.class}
  		classes.uniq.must_equal([FarMar::Vendor])
  	end
  end

  describe "Vendor#market,product,sales" do 
  	it "should return the instance type of the methods" do
  		vendor54.market.must_be_instance_of(FarMar::Market)
  		vendor54.products.must_be_instance_of(Array)
  		vendor54.sales.must_be_instance_of(Array)
  	end

  	it "should return correct values from vendor methods" do
  		vendor54.products.count.must_equal(5)
  		vendor54.sales.count.must_equal(8)
  		vendor54.market.id.must_equal(13)
  	end
  end

  describe "Vendor#revenue" do
  	it "should return the revenue from a vendor" do
  		vendor54.revenue.must_equal(39552)
  	end
  end

  describe "Vendor#by_market(market_id)" do
  	it "should return count of vendors for a market" do
  		FarMar::Vendor.by_market(2).count.must_equal(3)
  	end
  end
end