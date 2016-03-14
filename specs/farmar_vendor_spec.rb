require_relative './spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_vendor'

describe FarMar::Vendor do
  it "should be an object we have access to" do
    FarMar::Vendor.wont_be_nil
  end

  it "should create an instance of the FarMar::Vendor class" do
    # won't exist without other ones existing too
    vendor_hash = {

    }

    vendor = FarMar::Vendor.new(vendor_hash)
    vendor.wont_be_nil
  end
end
