require_relative './spec_helper'

describe FarMar::Vendor do
  it "is an object that I have access to" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor class methods" do
    let(:vendor_ten) { FarMar::Vendor.find(10) }

    it "should return an array of instances using the self.all method" do
      FarMar::Vendor.all.must_be_instance_of Array
    end

    it "should return a specific instance matching given id using the self.find method" do
      vendor_ten.must_be_instance_of FarMar::Vendor
      vendor_ten.name.must_equal "Kertzmann LLC"
      vendor_ten.id.must_equal 10
    end

  end
end