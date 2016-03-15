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

describe "FarMar::Vendor#self.find(id)" do
  it "should return an instance of FarMar::Vendor" do
    FarMar::Vendor.find(9).must_be_instance_of FarMar::Vendor
  end

  it "should return the name of the instance of FarMar::Vendor that has the ID 11" do
    FarMar::Vendor.find(11).name.must_equal "Donnelly-Quigley"
  end
end
