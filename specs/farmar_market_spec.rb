require_relative './spec_helper'

describe FarMar::Market do
  it "should be an object we have access to" do
    FarMar::Market.wont_be_nil
  end
end

describe "FarMar::Market#self.all" do
  it "should return an instance with attributes that are the same as the values
    in the first line of the CSV file" do
    # should return the same name
      FarMar::Market.all[0].name.must_equal "People's Co-op Farmers Market"
  end
end

describe "FarMar::Market#self.find(id)" do
  it "should return an instance of FarMar::Market" do
    FarMar::Market.find(9).must_be_instance_of FarMar::Market
  end

  it "should return the name of the instance of FarMar::Market that has the ID 11" do
    FarMar::Market.find(11).name.must_equal "Charles Square"
  end
end

describe "FarMar::Market#vendors" do
  it "should return an array containing instances of FarMar::Vendor" do
    FarMar::Market.find(1).vendors[0].must_be_instance_of FarMar::Vendor
  end

  it "should return the name 'Bechtelar Inc' for the first vendor with the market ID 2" do
    FarMar::Market.find(2).vendors[0].name.must_equal "Bechtelar Inc"
  end
end

## tests for optional requirements
describe "FarMar::Market#preferred_vendor" do
  it "should return an instance of FarMar::Vendor" do
    FarMar::Market.find(1).preferred_vendor.must_be_instance_of FarMar::Vendor
  end

  it "should return the name of the correct instance with the highest revenue for that market" do
    FarMar::Market.find(1).preferred_vendor.name.must_equal FarMar::Vendor.find(5).name
  end
end

describe "FarMar::Market#worst_vendor" do
  it "should return an instance of FarMar::Vendor" do
    FarMar::Market.find(1).worst_vendor.must_be_instance_of FarMar::Vendor
  end

  it "should return the name of the correct instance with the highest revenue for that market" do
    FarMar::Market.find(1).worst_vendor.name.must_equal FarMar::Vendor.find(6).name
  end
end
