require_relative './spec_helper'

describe FarMar::Vendor do
  before do
    @vendor = FarMar::Vendor.new
  end

  it "is an object we have access to" do
    @vendor.wont_be_nil
  end
end

describe FarMar::Vendor do
  before do
  @vendor = FarMar::Vendor
  end
  it "will return an array of vendor instances" do
    @vendor.all.class.must_equal Array
  end

  it "will return a vendor with id 5" do
    @vendor.find("5").must_be_instance_of FarMar::Vendor
  end



end
