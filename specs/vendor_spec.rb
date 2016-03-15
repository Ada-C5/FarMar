require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Vendor do

  it "does this exist" do
    FarMar::Vendor.wont_be_nil
  end

  describe "self.all" do
    let(:all_vendors) { FarMar::Vendor.all}

    it "creates an array of vendor info" do
      all_vendors.must_be_instance_of(Array)
    end

    it "creates an array of vendor instances" do
      classes = all_vendors.map { |vendor| vendor.class }
      classes.uniq.must_equal [FarMar::Vendor]
    end
  end

  describe "self.find" do
    let(:vendor_ten) {FarMar::Vendor.find(10)}

    it "should find instance of vendor given id" do
      vendor_ten.name.must_equal("Kertzmann LLC")
    end

    it "should return nil when it can't find vendor" do
      FarMar::Vendor.find(-3).must_be_nil
    end

  end

end
