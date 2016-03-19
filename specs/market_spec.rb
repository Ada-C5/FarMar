require_relative './spec_helper'

describe FarMar::Market do
  let (:market) {FarMar::Market}
  let (:market_12) { FarMar::Market.new(["12", "Coxsackie Farmers' Market","1 Betke Boulevard","Coxsackie,Greene","New York","12051"])}

  it "should be an object we have access to" do
    market.wont_be_nil
  end

  it "should return class 'FarMar::Market' for joe = FarMar::Market.new" do
    market_12.class.must_equal FarMar::Market
  end

  describe "FarMar::Market#self" do
    it "should return an array of instances from csv file" do
      market.all.class.must_equal Array
    end
  end

  describe "FarMar::Market#find(id)" do
    it "should return the instance of 'People's Co-op Farmers Market' FarMar::Market.find('1')" do
      market.find("1").name.must_equal "People's Co-op Farmers Market"
    end

    it "should return an instance of FarMar::Market for FarMar::Market.find(1)" do
      market.find("1").must_be_instance_of FarMar::Market
    end
  end

  describe "FarMar::Market#vendor" do
    it "should return a collection of vendor instances that are associated with market.id = 12" do
      # create an instance of market with id = 12
      market_12.vendor.length > 10
    end
  end

  describe "FarMar::Market#products" do
    it "return a collection of products" do
      products = market_12.products.map {|product| product.class}
      products.uniq.must_equal [FarMar::Product]
    end
  end

  describe "FarMar::Market#search(search_term) SELF CLASS" do
    it "return a collectio nof FarMar::market" do
      search_results = market.search("school").map {|result| result.class}
      search_results.uniq.must_equal [FarMar::Market]
    end

    it "return '3' for self.search('school')" do
      market.search("school").length.must_equal 3
    end

    it "return '3' for self.search('school')" do
      search_results = market.search("school").map {|result| result.name}
      search_results.include? "Fox School Farmers"
    end

    it "return '3' for self.search('school')" do
      search_results = market.search("school").map {|result| result.id}
      search_results.include? "75"    end
  end

  describe "FarMar::Market#prefered_vendor" do
    it "returns FarMar::Vendor instance" do
      market_12.prefered_vendor.class.must_equal FarMar::Vendor
    end
  end

  describe "FarMar::Market#prefered_vendor_by (date)" do
    it "returns FarMar::Vendor instance" do
      market_12.prefered_vendor_by("2013-11-08 04:31:41 -0800").class.must_equal FarMar::Vendor
    end
  end

  describe "FarMar::Market#worst_vendor" do
    it "returns FarMar::Vendor instance" do
      market_12.worst_vendor.class.must_equal FarMar::Vendor
    end
  end

  describe "FarMar::Market#worst_vendor_by (date)" do
    it "returns FarMar::Vendor instance" do
      market_12.worst_vendor_by("2013-11-08 04:31:41 -0800").class.must_equal FarMar::Vendor
    end
  end

end
