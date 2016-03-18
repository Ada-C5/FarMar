require_relative './spec_helper'

describe FarMar::Market do
  #For all Market Tests, IDs 1-500, and will test at random.
  let(:random_market_id) { ("1".."500").to_a.sample }
  let(:market_test) { FarMar::Market.new( [random_market_id, nil, nil, nil, nil, nil, nil] ) }

  it "is an object we have access to" do
    FarMar::Market.wont_be_nil
  end

  describe "self.all" do #how do we show this is a class method?
    it "returns an array of instances" do
    FarMar::Market.all.must_be_kind_of(Array)
    end
  end


  describe "self.search" do
    it "returns a collection of FarMar::Market instances where the market name or vendor name contain the search_term. For example FarMar::Market.search('school') would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market)" do
    FarMar::Market.search('school').length.must_equal(3)
    end

    it "returns a collection of FarMar::Market instances where the market name or vendor name contain the search_term. A collection of FarMar::Markets will be returned even for search terms included only in vendor names ('Zulaf')" do
    markets = FarMar::Market.search('Zulauf')
    markets.each { |instance| instance.must_be_instance_of(FarMar::Market) }
    end
  end

  describe "self.find" do
    it "can find a market instance based on ID" do
    FarMar::Market.find(random_market_id).must_be_instance_of(FarMar::Market)
    end
  end

  describe "FarMar::Markets#vendors" do
    it "returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field." do
    vendors_collection = market_test.vendors
    vendors_collection.must_be_kind_of(Array)
    #each item in the Array will be an instance of FarMar::Vendor
    vendors_collection.each { |instance| instance.must_be_instance_of(FarMar::Vendor) }
    end
  end

  describe "FarMar::Markets#products" do
    it "returns a collection of FarMar::Product instances that are associated to the market through the FarMar::Vendor class." do
    products_collection = market_test.products
    products_collection.must_be_kind_of(Array)
    #each item in the Array will be an instance of FarMar::Product
    products_collection.each { |instance| instance.must_be_instance_of(FarMar::Product) }
    end
  end

  describe "FarMar::Markets#prefered_vendor" do
    it "returns the vendor with the highest revenue" do
    market_test.prefered_vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "FarMar::Markets#worst_vendor" do
    it "returns the vendor with the lowest revenue" do
    market_test.worst_vendor.must_be_instance_of(FarMar::Vendor)
    end
  end


end
