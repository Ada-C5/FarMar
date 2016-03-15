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

describe "FarMar::Vendor#markets" do
  it "should return an instance of FarMar::Market" do
    FarMar::Vendor.find(20).markets.must_be_instance_of FarMar::Market
  end
end

describe "FarMar::Vendor#products" do
  it "should return an array" do
    FarMar::Vendor.find(20).products.is_a? Array
  end

  it "should return an array of instances of FarMar::Product" do
    FarMar::Vendor.find(20).products[0].must_be_instance_of FarMar::Product
  end
end

describe "FarMar::Vendor#sales" do
  it "should return an array of instances of FarMar::Sale" do
    FarMar::Vendor.find(20).sales[0].must_be_instance_of FarMar::Sale
  end
end

describe "FarMar::Vendor#revenue" do
  it "should return the revenue as a fixnum" do
    FarMar::Vendor.find(13).revenue.is_a? Fixnum
  end
end
