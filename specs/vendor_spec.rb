require_relative './spec_helper'

describe FarMar::Vendor do
  let (:vendor) { FarMar::Vendor.find(2690) }
  let (:all_vendors) { FarMar::Vendor.all }

  it "will not be nil" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor#self.all" do
    it "will not be nil" do
      all_vendors.wont_be_nil
    end
  end

  describe "FarMar::Vendor#self.find(id)" do
    it "will not be nil" do
      vendor.wont_be_nil
    end

    it "will find the correct instance" do
    vendor.name.must_equal "Mann-Lueilwitz"
    end

    it "returns false if it can't find the vendor" do
      FarMar::Vendor.find(3_000_000).must_equal false
    end

  end

  describe "FarMar::Vendor#market" do
    it "will find the correct market for the vendor" do
      vendor.market.name.must_equal "Montefiore Medical Center Farmers Market_Thursday"
    end
  end

  describe "FarMar::Vendor#products" do
    it "will return an array" do
      vendor.products.must_be_instance_of Array
    end

    it "will return the correct products for the vendor" do
      vendor.products[1].id.must_equal("8190")
    end
  end

  describe "FarMar::Vendor#sales" do
    it "will return an array" do
      vendor.sales.must_be_instance_of Array
    end

    it "will return the correct sales for the vendor" do
      vendor.sales[0].id.must_equal("12000")
    end
  end

  describe "FarMar::Vendor#revenue" do
    it "will return a fixnum" do
      vendor.revenue.must_be_instance_of Float
    end

    it "will return the coorect revnue for the vendor" do
      vendor.revenue.must_equal(33_393)
    end
  end

  describe "FarMar::Vendor#self.by_market" do
    it "will return an array" do
      FarMar::Vendor.by_market(498).must_be_instance_of Array
    end
  end

end
