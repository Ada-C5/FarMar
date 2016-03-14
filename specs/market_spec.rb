require_relative './spec_helper'

describe FarMar::Market do
  it "should be an object we have access to" do
    FarMar::Market.wont_be_nil
  end

  it "should return class 'FarMar::Market' for joe = FarMar::Market.new" do
    joe = FarMar::Market.new(name: "Joe", id: 1234)
    joe.class.must_equal FarMar::Market
  end
end

describe "FarMar::Market#self" do
  it "should return an array of instances from csv file" do
    FarMar::Market.all.class.must_equal Array
  end
end
