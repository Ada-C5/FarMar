require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Vendor do

  it "does this exist" do
    FarMar::Vendor.wont_be_nil
  end

  it "creates an array of vendor info" do
    FarMar::Vendor.all.must_be_instance_of(Array)
  end

  it "creates an array of vendor instance" do
    FarMar::Vendor.all.class.must_equal(Array)
  end

end
