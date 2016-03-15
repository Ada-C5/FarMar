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

  describe "market" do
    let(:vendor_five) { FarMar::Vendor.find(5)}

    it "should return the market where the vendor sells" do
      vendor_five.market[0].market_id.must_equal(1)
    end

    # it "vendors should have same market_id as the market" do
      # market_one.market_id.must_equal(market_one.vendors[1].market_id)
    # end

  end

end
