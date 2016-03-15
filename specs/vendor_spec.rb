require_relative './spec_helper'
require_relative '../far_mar.rb'

describe FarMar::Vendor do                                         #this is testing to make sure Player exists
  it "will not be nil" do
    FarMar::Vendor.wont_be_nil
  end
end

describe "Vendor#all" do
  let(:all_vendors){FarMar::Vendor.all}

  it "makes an array of all the vendors" do
    FarMar::Vendor.all.wont_be_nil
  end

  it "returns an array" do      #want to describe what the method is doing, not what the test is doing
    all_vendors.class.must_equal(Array)
  end

  it "makes sure that the first element is an instance of a Vendor/Vendor object" do
    all_vendors.first.class.must_equal(FarMar::Vendor)
  end

  it "returns an array full of FarMar::Vendor instances" do
    classes = all_vendors.map { |v| v.class }
    classes.uniq.must_equal [FarMar::Vendor]
  end


end


describe "Vendor#find" do
  let(:vendor) {FarMar::Vendor.find(24)}

  it"makes sure that the id requested matches the id given" do
    vendor = FarMar::Vendor.find(24)
    vendor.vendor_id.must_equal("24")
  end

  it "knows basic info about a vendor" do
    vendor.vendor_id.must_equal "24"
    vendor.vendor_name.must_equal "Heaney, Schiller and Stehr"
    vendor.num_employ.must_equal "7"
    vendor.market_id.must_equal "8"
  end
end
