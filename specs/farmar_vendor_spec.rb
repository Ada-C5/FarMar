require_relative 'spec_helper'

describe FarMar::Vendor do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Vendor.wont_be_nil
  end


  # runs the .all method to create instances for each row in vendors.csv
  # checks the length
  it "returns total number of vendors => 2690 instances" do
    vendors = FarMar::Vendor.all
    vendors.length.must_equal(2690)
  end

end
