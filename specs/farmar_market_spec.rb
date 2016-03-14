require_relative './spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_market'

describe FarMar::Market do
  it "should be an object we have access to" do
    FarMar::Market.wont_be_nil
  end

  it "should create an instance of the FarMar::Market class" do
    market_hash = {

    }

    market = FarMar::Market.new(market_hash)
    market.wont_be_nil
  end
end
