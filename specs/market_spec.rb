require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Market do
  let(:markets) { FarMar::Market.all }

  # make sure there is a market class
  it "Is there a class? Anything?" do
    FarMar::Market.wont_be_nil
  end

  # test self.all method to make sure it makes an array of product instances
  it "self.all returns an array of instances!" do
    FarMar::Market.all.class.must_equal Array
  end

  # test self.all is populating correctly
  it "what is the name of the first market?" do
    markets[0].name.must_equal "People's Co-op Farmers Market"
  end

  # test self.find(if)
  it "is the right market corresponding with passed id?" do
    FarMar::Market.find(23).name.must_equal "Farmers Market on the Westford Common"
  end

  # tests vendor method
  it "should return all vendor instances in specific market" do
    market = markets[0]
    market.vendors(market.id).length.must_equal 6
  end

  # test products method
  it "should return all products at market (by all vendors)" do
    my_market = markets[3]
    my_market.class.must_equal FarMar::Market
    my_market.products(my_market.id).class.must_equal Array
    my_market.products(my_market.id)[0].class.must_equal FarMar::Product 
    my_market.products(my_market.id)[1].class.must_equal FarMar::Product
  end

  # test self.search method
  it "should return markets with search term in name of market or its vendors" do
    FarMar::Market.search("Green").length.must_equal 54
    FarMar::Market.search("green").length.must_equal 54
    FarMar::Market.search("farmers").length.must_equal 396
    FarMar::Market.search("farMers").length.must_equal 396
  end

  # test prefered vendor
  it "should return vendor with highest income" do
    markets[4].prefered_vendor.class.must_equal FarMar::Vendor
  end

  #test prefered vendor(date) method
  it "should return vendor with highest income from certain day" do
    markets[2].prefered_ven("2013-11-10").class.must_equal FarMar::Vendor
  end
end
