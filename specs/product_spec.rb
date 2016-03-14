require_relative './spec_helper'

describe FarMar::Product do
  it "is an object we have access to" do
    FarMar::Product.wont_be_nil
  end

  describe "FarMar::Product#all" do
    it "returns an array of instances" do
    FarMar::Product.all.must_be_kind_of(Array)
    end

    it "can find a product instance based on ID" do
    #we have Product IDs 1-8193, and will test at random!
    id = (1..8193).to_a.sample
    FarMar::Product.find(id).must_be_instance_of(FarMar::Product)
    end
  end
end
