require_relative 'spec_helper'

describe FarMar::Market do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Market.wont_be_nil
  end

  let(:markets_all) {FarMar::Market.all}
  let(:markets_find) {FarMar::Market.find(1)}

  # runs the self.all method to create instances for each row in markets.csv
  # checks the length
  it "returns total numbers of markets csv => 500 instances" do
    markets_all.length.must_equal(500)
  end

  # check the self.find(id) method
  it "should return the id of the instance if .find(id = 1)" do
    markets_find.id.must_equal(1)
  end

  # check the vendor method
  it "should return the number of vendors with the matching market id" do
    markets_find.vendors.length.must_equal(6)
  end

end
