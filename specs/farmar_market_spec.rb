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

  # check the .find(id) method
  it "should return the id of the instance if .find(id = 1)" do
    FarMar::Market.find(1).id.must_equal(1)
  end



end
