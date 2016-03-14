require_relative './spec_helper'

describe FarMar::Vendor do

  VENDOR_TEST = {
    employees: 4,
    mid: 3,
    name: "name",
    vid: 2
  }
  describe "Vendor#new" do
    it "can create new instances of Vendor with correct amount" do
      vendor = FarMar::Vendor.new(VENDOR_TEST)
      vendor.market_id.must_equal 3
    end
  end

end
