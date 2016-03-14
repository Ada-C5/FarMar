require_relative './spec_helper'

describe FarMar::Market do
  it "is an object that I have access to" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Market class methods" do
    it "is an instance of Array using the self.all method" do
      FarMar::Market.all.must_be_instance_of Array
    end

    it "returns nil if no matching id number is found using self.find method" do
      FarMar::Market.find(1111111111).must_be_nil
    end

    it "returns the correct instance of FarMar::Market if the matching id is found using self.find method" do
      instance_found = FarMar::Market.find(495)
      instance_found.must_be_instance_of FarMar::Market
      instance_found.id.must_equal 495
      instance_found.name.must_equal "South Bend Farmers Market"
    end

  end
end