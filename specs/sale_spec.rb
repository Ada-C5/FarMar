require_relative './spec_helper'

describe FarMar::Sale do
  it "is an object we have access to" do
    FarMar::Sale.wont_be_nil
  end

  describe "FarMar::Sale#all" do
    it "returns an array of instances" do
    FarMar::Sale.all.must_be_kind_of(Array)
    end
  end

  describe "FarMar::Sale#find" do
    it "can find a product instance based on ID" do
    #we have Sale IDs 1-12001, and will test at random!
    id = ("1".."12001").to_a.sample
    FarMar::Sale.find(id).must_be_instance_of(FarMar::Sale)
    end
  end

end
