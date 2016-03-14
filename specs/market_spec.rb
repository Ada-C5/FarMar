require_relative './spec_helper'
require_relative '../farmar'

require 'simplecov'
SimpleCov.start

describe "FarMar#Market" do
  it "can create a new instance from markets.csv" do
    market = FarMar::Market.new(0)
    assert_equal "People's Co-op Farmers Market", market.name
  end
end
