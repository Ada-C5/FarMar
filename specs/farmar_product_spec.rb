require_relative './spec_helper'

describe FarMar::Product do
  it "should be an object we have access to" do
    FarMar::Product.wont_be_nil
  end
end

describe "FarMar::Product#self.all" do
  it "should return an instance with attributes that are the same as the values
    in the first line of the CSV file" do
    # should return the same name
      FarMar::Product.all[0].name.must_equal "Dry Beets"
  end
end

describe "FarMar::Product#self.find(id)" do
  it "should return an instance of FarMar::Product" do
    FarMar::Product.find(9).must_be_instance_of FarMar::Product
  end

  it "should return the name of the instance of FarMar::Product that has the ID 11" do
    FarMar::Product.find(11).name.must_equal "Gigantic Bread"
  end
end
