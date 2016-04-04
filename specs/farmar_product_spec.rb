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

describe "FarMar::Product#vendor" do
  it "should return an instance of FarMar::Vendor" do
    FarMar::Product.find(20).vendor.must_be_instance_of FarMar::Vendor
  end
end

describe "FarMar::Product#sales" do
  it "should return an array of instances of FarMar::Sale" do
    FarMar::Product.find(20).sales[0].must_be_instance_of FarMar::Sale
  end
end

describe "FarMar::Product#number_of_sales" do
  it "should return 8 for the product id of 4" do
    FarMar::Product.find(4).number_of_sales.must_equal 8
  end
end

describe "FarMar::Product#self.by_vendor" do
  it "should return an array of instances of FarMar::Product" do
    FarMar::Product.by_vendor(15).is_a? Array
  end
  # just to show that the correct markets were returned
  it "should return the name of the second instance in the array when given 2" do
    FarMar::Product.by_vendor(2)[1].name.must_equal "Heavy Chicken"
  end
end
