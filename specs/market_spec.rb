require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Market do

  it "does this exist" do
    FarMar::Market.wont_be_nil
  end

  it "creates an array of market instance" do
    FarMar::Market.all.class.must_equal(Array)
  end

  it "creates instances of market from csv file" do
    classes = FarMar::Market.all.map { |market| market.class }
    classes.uniq.must_equal [FarMar::Market]
  end

  it "creates an instance of FarMar::Market" do
    FarMar::Market.new([4, "yay", "dirt", "ryan", "claire", "five", "six"]).must_be_instance_of(FarMar::Market)
  end

  describe "self.find" do

     it "should find instance of market with matching id" do
       FarMar::Market.find(1).name.must_equal("People's Co-op Farmers Market")
     end

     it "should return nil when it can't find a matching market id" do
       FarMar::Market.find(2727272727).must_equal(nil)
     end

  end

  describe ".vendors" do
    let(:market_one) {FarMar::Market.find(1)}

    it "should return an array of that market's vendors" do
      market_one.vendors.must_be_instance_of(Array)
    end

    it "vendors should have same market_id as the market" do
      market_one.market_id.must_equal(market_one.vendors[1].market_id)
    end

  end

  describe "products" do
    let(:market_one) {FarMar::Market.find(1)}

    it "should return array of products sold by that market" do
      market_one.products.must_be_instance_of Array
    end

    it 'should return instances of product' do
      market_one.products[0].class.must_equal FarMar::Product
    end

  end

  describe 'self.search' do
    it "should return collection where search term is in market name" do
      FarMar::Market.search('school').length.must_equal 3
    end
  end

  describe 'preferred_vendor' do
    it "should return vendor in that market with highest revenue" do
      market = FarMar::Market.find(1)
      market.preferred_vendor.vendor_id.must_equal(5)
    end
  end

  describe 'worst_vendor' do
    it "should return vendor in that market with least revenue" do
      market = FarMar::Market.find(1)
      market.worst_vendor.vendor_id.must_equal(6)
    end
  end

end
