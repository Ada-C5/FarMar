require_relative 'spec_helper'

describe FarMar::Vendor do
  let(:all_vendors) { FarMar::Vendor.all }
  let(:vendor) { FarMar::Vendor.find(14) }

  it "exists" do
    FarMar::Vendor.wont_be_nil
  end

  describe "Vendor#self.all" do
    it "creates an array of Vendor objects" do
      all_vendors.must_be_instance_of Array
      all_vendors[0].must_be_instance_of FarMar::Vendor
    end
  end

  describe "Vendor#self.find(find_id)" do
    it "returns the Vendor object with matching id" do
      this_id = all_vendors[13].id

      vendor.must_be_instance_of FarMar::Vendor
      vendor.id.must_equal this_id
      vendor.name.must_equal "Stracke Group"
    end
  end

  describe "Vendor#market" do
    it "finds the Market that the Vendor is goes to" do
      all_vendors[13].market.must_be_instance_of FarMar::Market
    end
  end

  describe "Vendor#products" do
    it "should return all instances of Vendor that match the Vendor's id" do
      # uncomment the following line to see the products array
      # ap vendor.products
      vendor.products.must_be_instance_of Array
      vendor.products.length.must_equal 2
      vendor.products[0].vendor_id.must_equal "14"
    end
  end

  describe "Vendor#sales" do
    it "should return all instances of Vendor that match the Vendor's id" do
      # uncomment the following line to see the sales array
      ap vendor.sales
      vendor.sales.must_be_instance_of Array
      vendor.sales.length.must_equal 3
      vendor.sales[0].vendor_id.must_equal "14"
    end
  end

end
