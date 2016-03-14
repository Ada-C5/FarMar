require_relative './spec_helper'

describe FarMar::Vendor do
  it "is an object that is an instance of a Class" do
    FarMar::Vendor.must_be_instance_of Class
  end

  describe "FarMar::Vendor#self.all" do
    it "should return an incredibly large array" do
      FarMar::Vendor.all.must_be_instance_of Array
    end
  end

  describe "FarMar::Vendor#self.find" do
    it "should return 'Jakubowski-Robel' when id 32 passed in" do
      FarMar::Vendor.find(32).name.must_equal "Jakubowski-Robel"
    end

    it "should return 'ID not found!' when self.find called by id 3000" do
      FarMar::Vendor.find(3000).must_equal "ID not found!"
    end

  end

  describe "FarMar::Vendor#markets" do
    vendor1 = FarMar::Vendor.new(market_id: 10)
    it "should return the market associated with market id 10, and name should be Saratoga Farmers' Market" do
      vendor1.markets(10)[0].name.must_equal "Saratoga Farmers' Market"
    end
  end

  describe "FarMar::Vendor#products" do
    vendor2 = FarMar::Vendor.new(id: 26)
    it "should return 3 markets associated with vendor id 26" do
      vendor2.products(26).length.must_equal 3
    end
  end

end
