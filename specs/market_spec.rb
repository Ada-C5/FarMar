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

  describe "self.find" do
    it "can find a market instance based on ID" do
    FarMar::Market.find(random_market_id).must_be_instance_of(FarMar::Market)
    end
  end

  describe "FarMar::Markets#vendors" do
    it "returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field." do
    vendors_collection = market_test.vendors
    vendors_collection.must_be_kind_of(Array)

    #any item in the Array will be an instance of FarMar::Vendor
    number_of_vendors = vendors_collection.length
    random_vendor = (0...number_of_vendors).to_a.sample
    vendors_collection[random_vendor].must_be_instance_of(FarMar::Vendor)
    end
  end

end
