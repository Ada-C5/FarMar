require_relative "./spec_helper"
require_relative "../far_mar"


describe FarMar::Market do
 	let (:market15) {FarMar::Market.find(15)}
  it "it is an object we have acccess to" do
    FarMar::Market.wont_be_nil
  end

  describe "Market#find" do
 

  	it "checks that market15 is instance of an array" do
  		market15.must_be_instance_of(Array)
  	end

  	it "returns nil for id numbers that don't exist" do
  		FarMar::Market.find(10_000).must_equal(nil)
  	end

  	it "checks the values of each variable for market15" do
  		market15[0].must_equal(15)
  		market15[1].must_equal("Farmers Market in Denison")
  		market15[2].must_equal("1 block west of Main St.")
  		market15[3].must_equal("Denison")
  		market15[4].must_equal(nil)
  		market15[5].must_equal("Texas")
  		market15[6].must_equal("75090")
  	end
  end

  describe "Market#all" do
  	let (:market) {FarMar::Market.all} 

  	it "market should be instance of hash" do
  		market.must_be_instance_of(Array)
  	end

  	it "market should have 500 entries" do
  		market.count.must_equal(500)
  	end

  	it "should return array full of instances" do
  		classes = market.map{|m| m.class}
  		classes.uniq.must_equal([FarMar::Market])
  	end
  end

  describe "Market#vendor" do
  	market13 = FarMar::Market.new(id: 13, name: "Otsiningo Park Farmers' Market",
  						address: "1 Bevier St", city:"Binghamton",county: "Broome",
  						state: "New York", zip: "13905")
  	it "should return an array of vendors" do
  		market13.vendor.must_be_instance_of(Array)
  	end

  	it "should return vendor count for a market" do
  		market13.vendor.count.must_equal(7)
  	end
  end
end