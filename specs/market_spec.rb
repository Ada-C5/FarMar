require_relative './spec_helper'
require_relative '../far_mar.rb'

describe FarMar::Market do           #this is testing to make sure Player exists
  it "will not be nil" do
    FarMar::Market.wont_be_nil
  end
end


describe "Market#all" do
  it "makes an array of all the markets" do
    FarMar::Market.all.wont_be_nil
  end
  it "returns an array" do      #want to describe what the method is doing, not what the test is doing
    FarMar::Market.all.class.must_equal(Array)
  end
  it "makes sure that the first element is an instance of a Market/Market object" do
    FarMar::Market.all.first.class.must_equal(FarMar::Market)
  end
end


describe "Market#find" do
  it"makes sure that the id requested matches the id given" do
    market = FarMar::Market.find(4)
    market.market_id.must_equal("4")
  end

end
