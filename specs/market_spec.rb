require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Market do
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
    markets = FarMar::Market.all
    markets[0].name.must_equal "People's Co-op Farmers Market"
  end

  # test self.find(if)
  it "is the right market corresponding with passed id?" do
    FarMar::Market.find(23).name.must_equal "Farmers Market on the Westford Common"
  end

  # tests vendor method
  it "should return all vendor instances in specific market" do
    markets = FarMar::Market.all
    market = markets[0]
    # market_instance = market[0]
#    market1.must_equal.class.must_equal 4
    market.vendors(market.mar_id).length.must_equal 6
  end

  # # tests vendor method
  # it "should return all vendor instances in specific market" do
  #   FarMar::Market.vendors(1).length.must_equal 6
  # end
end
