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

describe "FarMar::Markets#vendors" do
  it "should return an array containing instances of FarMar::Vendor" do
    FarMar::Market.find(1).vendors[0].must_be_instance_of FarMar::Vendor
  end

  it "should return the name 'Bechtelar Inc' for the first vendor with the market ID 2" do
    FarMar::Market.find(2).vendors[0].name.must_equal "Bechtelar Inc"
  end
end
