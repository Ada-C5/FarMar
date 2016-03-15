require_relative 'spec_helper'

describe FarMar::Vendor do
  it "exists" do
    FarMar::Vendor.wont_be_nil
  end

  describe "Vendor#self.all" do
    it "creates an array of Vendor objects" do
      FarMar::Vendor.all.must_be_instance_of Array
      FarMar::Vendor.all[0].must_be_instance_of FarMar::Vendor
    end
  end

  describe "Vendor#self.find(find_id)" do
    it "returns the Vendor object with matching id" do
      this_id = FarMar::Vendor.all[13].id

      FarMar::Vendor.find(14).must_be_instance_of FarMar::Vendor
      FarMar::Vendor.find(14).id.must_equal this_id
      FarMar::Vendor.find(14).name.must_equal "Stracke Group"
    end
  end

  describe "Vendor#market" do
    it "finds the Market that the Vendor is goes to" do
      FarMar::Vendor.all[13].market.must_be_instance_of FarMar::Market
    end
  end

  describe "Vendor#products" do
    it "should return all instances of Vendor that match the Vendor's id" do
      ap FarMar::Vendor.find(14).products
      FarMar::Vendor.find(14).products.must_be_instance_of Array
      FarMar::Vendor.find(14).products.length.must_equal 2
      FarMar::Vendor.find(14).products[0].vendor_id.must_equal "14"
    end
  end

  describe "Vendor#sales" do
    it "should return all instances of Vendor that match the Vendor's id" do
      ap FarMar::Vendor.find(14).sales
      FarMar::Vendor.find(14).sales.must_be_instance_of Array
      FarMar::Vendor.find(14).sales.length.must_equal 3
      FarMar::Vendor.find(14).sales[0].vendor_id.must_equal "14"
    end
  end

end
