require_relative './spec_helper'
require_relative '../lib/vendor'

describe FarMar::Vendor do
  it "Vendor Class exist?" do
    FarMar::Vendor.wont_be_nil
  end

  describe "#self.all(file)" do
    let(:all_vendors) { FarMar::Vendor.all}

    it "Return an array?" do
      all_vendors.must_be_instance_of Array
    end

    it "Return an array full of FarMar::Vendor Instances?" do
      classes = all_vendors.map { |m| m.class}
      classes.uniq.must_equal [FarMar::Vendor]
    end
  end

  describe "#self.find(id)" do
    let(:vendor) { FarMar::Vendor.find(1) }

    it "Know basic data about vendor?" do
      vendor.must_be_instance_of FarMar::Vendor
      vendor.id.must_equal(1)
      vendor.name.must_equal("Feil-Farrell")
      vendor.no_of_employees.must_equal(8)
      vendor.market_id.must_equal(1)
    end

    it "Returns nil if vendor is not found?" do
      FarMar::Vendor.find(10_000).must_equal(nil)
    end
  end

  describe "#self.by_market" do
    it "Returns all of the vendors with the given market_id?" do
      vendor = FarMar::Vendor.by_market(1)
      vendor.length.must_equal(6)
      vendor.must_be_instance_of Array
    end
  end

  describe "#market" do
    let(:vendor) {FarMar::Vendor.find(13)}
    it "Returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field" do
      vendor_market = vendor.market
      vendor_market.must_be_instance_of FarMar::Market
      vendor.market_id.must_equal(4)
    end
  end

  describe "#products" do
    let(:vendor) {FarMar::Vendor.find(16)}
    it "Returns a collection of FarMar::Product instances that are associated by the FarMar::Product" do
      products = vendor.products
      products.length.must_equal(5)
    end
  end

end
