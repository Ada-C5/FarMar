require_relative './spec_helper'

describe FarMar::Vendor do
  it "should be an object we have access to" do
    FarMar::Vendor.wont_be_nil
  end
end

describe "FarMar::Vendor#self.all" do
  it "should return an instance with attributes that are the same as the values
    in the first line of the CSV file" do
    # should return the same name
      FarMar::Vendor.all[0].name.must_equal "Feil-Farrell"
  end
end
