require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Vendor do
  # make sure there is a sale class
  it "Is there a class? Anything?" do
    FarMar::Vendor.wont_be_nil
  end

  # make sure self.all works
  it "should return an array of vendors" do
    vendors = FarMar::Vendor.all
    vendors.class.must_equal Array
    vendors[4].name.must_equal "Reynolds, Schmitt and Klocko"
  end

  # test self.find(id)
  it "should return the right account with id" do
    FarMar::Vendor.find(44).name.must_equal "Kassulke, Leannon and Bins"
    FarMar::Vendor.find(28).ven_id.must_equal 28
  end

  # test the market method
  it "should return an instance of the market associated with that vendor" do
    vendors = FarMar::Vendor.all
    vendor = vendors[0]
    vendor.market(vendor.mar_id).wont_be_nil
    vendor.market(vendor.mar_id).name.must_equal "People's Co-op Farmers Market"
  end

  # test the products method
  it "Should return all product instances for certain vendor" do
    vendors = FarMar::Vendor.all
    vendor = vendors[25]
    vendor.products(vendor.ven_id).length.must_equal 3
  end

  # test sale method
  it "should return collection of sale instances for certain vendor" do
    vendors = FarMar::Vendor.all
    vendor = vendors[25]
    vendor.sales(vendor.ven_id).class.must_equal Array
    vendor.sales(vendor.ven_id).length.must_equal 6
    vendor.sales(vendor.ven_id)[0].must_be_instance_of FarMar::Sale
    vendor.sales(vendor.ven_id)[0].amount.must_equal 6509
  end

  # test revenue method
  it "should return SUM of all sales for certain vendor" do
    vendors = FarMar::Vendor.all
    vendor = vendors[25]
    vendor.revenue(vendor.ven_id).must_equal 28014
  end

  # test self.by_market method
  it "should return collection of vendor instances with matching market_id" do
    FarMar::Vendor.by_market(1).length.must_equal 6
    FarMar::Vendor.by_market(1)[0].name.must_equal "Feil-Farrell"
  end


end