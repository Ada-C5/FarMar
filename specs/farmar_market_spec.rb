require_relative 'spec_helper'

describe FarMar::Market do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Market.wont_be_nil
  end

  # runs the .all method to create instances for each row in markets.csv
  # checks the length
  it "returns total numbers of markets csv => 500 instances" do
    markets = FarMar::Market.all
    markets.length.must_equal(500)
  end


end
