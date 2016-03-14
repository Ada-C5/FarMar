require_relative './spec_helper'
require_relative '../farmar'

describe "FarMar::Vendor#all" do
  it "returns new instances of Vendor for each entry in csv" do
    assert_equal (FarMar::Vendor.all).length, FarMar::Vendor::VENDOR_CSV.length
  end

  it "returns instances of Vendor" do
    assert_equal (FarMar::Vendor.all)[1].class, FarMar::Vendor
  end
end
