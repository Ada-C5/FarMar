require_relative 'spec_helper'

describe FarMar::Market do
  it "exists" do
    FarMar::Market.wont_be_nil
  end

  describe "Market#self.all" do
    it "creates an array of Market objects" do
      FarMar::Market.all.must_be_instance_of Array
      FarMar::Market.all[0].must_be_instance_of FarMar::Market
    end
  end

  describe "Market#self.find(find_id)" do
    it "returns the Market object with matching id" do
      this_id = FarMar::Market.all[13].id

      FarMar::Market.find(14).must_be_instance_of FarMar::Market
      FarMar::Market.find(14).id.must_equal this_id
      FarMar::Market.find(14).name.must_equal "Hartford Farmers Market"
    end
  end

  describe "Market#vendors" do
    it "should return all instances of Vendor that match the Market's id" do
      FarMar::Market.all[13].vendors.must_be_instance_of Array
      FarMar::Market.all[13].vendors.length.must_equal 8
      ap FarMar::Market.all[13].vendors
    end
  end

end
