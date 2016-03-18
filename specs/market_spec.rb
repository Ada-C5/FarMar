require_relative './spec_helper'


describe FarMar::Market do
  let(:market) { FarMar::Market.find(498) }

  it "will not be nil" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Market#self.all" do
    it "will not be nil" do
      FarMar::Market.all.wont_be_nil
    end
  end

  describe "FarMar::Market#self.find(id)" do
    it "will not be nil when it finds the market" do
      market.wont_be_nil
    end

    it "returns false if it can't find the market" do
      FarMar::Market.find(3_000_000).must_equal false
    end

    it "knows data about a particular market" do
      market.name.must_equal "Morningside Park Farmers Market"
    end
  end

  describe "FarMar::Market#vendors" do
    it "returns an array when called" do
      market.vendors.must_be_instance_of Array
    end

    it "returns the correct vendors"  do
     market.vendors[0].id.must_equal("2676")
    end
  end

  describe "FarMar::Market#products" do
    it "returns an array when called" do
      market.products.must_be_instance_of Array
    end

    it "returns the correct products for the market"  do
     market.products[0][0].id.must_equal("8141")
    end
  end

  describe "FarMar::Market#self.search(search_term)" do
    it "returns an array when called" do
      FarMar::Market.search("school").must_be_instance_of Array
    end

    it "returns the correct products for the market"  do
     FarMar::Market.search("school")[0].name.must_equal("Fox School Farmers Market")
    end
  end

  describe "FarMar::Market.preferred_vendor" do
    it "returns the vendor with the greatest revenue for a particular market" do
      market.preferred_vendor.name.must_equal("Cruickshank Group")
    end
  end

  describe "FarMar::Market.worst_vendor" do
    it "returns the vendor with the lowest revenue for a particular market" do
      market.worst_vendor.name.must_equal("Koepp-Haley")
    end 
  end
end
