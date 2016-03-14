require_relative 'spec_helper'

describe FarMar::Sale do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Sale.wont_be_nil
  end

    # runs the .all method to create instances for each row in products.csv
    # checks the length
    it "returns total number of sales => 12798 instances" do
      sales = FarMar::Sale.all
      sales.length.must_equal(12798)
    end

end
