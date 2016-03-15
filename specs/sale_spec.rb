require_relative 'spec_helper'

describe FarMar::Sale do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Sale.wont_be_nil
  end

  let(:sales_all) {FarMar::Sale.all}
  let(:sales_find) {FarMar::Sale.find(1)}

    # runs the .all method to create instances for each row in products.csv
    # checks the length
    it "returns total number of sales => 12798 instances" do
      sales_all.length.must_equal(12798)
    end

    # check the .find(id) method
    it "should return the id of the instance if .find(id = 1)" do
      sales_find.id.must_equal(1)
    end


end
