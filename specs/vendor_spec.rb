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

end
