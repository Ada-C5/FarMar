require_relative './spec_helper'

describe FarMar::Vendor do
  it "should be an object we have access to" do
    FarMar::Vendor.wont_be_nil
  end
end
