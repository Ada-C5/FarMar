require_relative './spec_helper'

describe FarMar::Sale do
  it "should be an object we have access to" do
    FarMar::Sale.wont_be_nil
  end
end

describe "FarMar::Sale#self.all" do
  it "should return an instance with attributes that are the same as the values
    in the first line of the CSV file" do
    # should return the same name
      FarMar::Sale.all[0].amount.must_equal "9290"
  end
end

describe "FarMar::Sale#self.find(id)" do
  it "should return an instance of FarMar::Sale" do
    FarMar::Sale.find("9").must_be_instance_of FarMar::Sale
  end

  it "should return the amount of the instance of FarMar::Sale that has the ID 11" do
    FarMar::Sale.find("11").amount.must_equal "1030"
  end
end
