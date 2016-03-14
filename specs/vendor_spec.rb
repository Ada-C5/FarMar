require_relative './spec_helper'

describe FarMar::Vendor do
  it "is an object we have access to" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor#all" do
    it "returns an array of instances" do
    FarMar::Vendor.all.must_be_kind_of(Array)
    end
  end

  describe "FarMar::Vendor#find" do
    it "can find a product instance based on ID" do
    #we have Vendor IDs 1-2690, and will test at random!
    id = (1..2690).to_a.sample
    FarMar::Vendor.find(id).must_be_instance_of(FarMar::Vendor)
    end
  end

end
