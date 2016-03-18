require_relative "./spec_helper"
require_relative "../far_mar"


describe FarMar::Market do
	market1 = FarMar::Market.new(id: 1, name: "People's Co-op Farmers Market", address: "30th and Burnside",
						city: "Portland", county: "Multnomah", state: "Oregon",zip: "97202")
	market13 = FarMar::Market.new(id: 13, name: "Otsiningo Park Farmers' Market",
						address: "1 Bevier St", city:"Binghamton",county: "Broome",
						state: "New York", zip: "13905")

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

  describe "Market#vendors" do
  	it "should return an array of vendors" do
  		market13.vendors.must_be_instance_of(Array)
  	end

  	it "should return vendor count for a market" do
  		market13.vendors.count.must_equal(7)
  	end
  end

  describe "Market#products" do
  	it "should return an array" do
  		market1.products.must_be_instance_of(Array)
  	end

  	it "should return the correct size of the array" do
  	 	market1.products.count.must_equal(13)
    end
  end

  describe "Market#search(search_term)" do
  	it "should return an array" do
  		FarMar::Market.search("Silverdale Farmers Market").must_be_instance_of(Array)
  	end

  	it "should return correct size of array" do
  		FarMar::Market.search("Von-").count.must_equal(2)
  		FarMar::Market.search("Top").count.must_equal(4)
  		FarMar::Market.search("Inc").count.must_equal(283)
  	end
  end

  describe "Market#prefered_vendor" do
  	it "should return an instance of FarMar::Vendor" do
  		market1.prefered_vendor.must_be_instance_of(FarMar::Vendor)
  	end

  	it "should return the correct vendor" do
  		market1.prefered_vendor.id.must_equal(5)
  	end
  end

end