require_relative './spec_helper'

describe FarMar::Market do
  let(:market) { FarMar::Market.find(1) }
  let(:ven_market) { FarMar::Market.new(id: 1)}

  it "is an object that is an instance of a Class" do
    market.must_be_instance_of FarMar::Market
  end

  describe "FarMar::Market#self.all" do
    it "should return an incredibly large array" do
      FarMar::Market.all.must_be_instance_of Array
    end
  end

  describe "FarMar::Market#self.find" do
    it "should return 'People's Co-op Farmers Market' as name" do
      market.name.must_equal "People's Co-op Farmers Market"
    end

    it "should return nil when self.find called by id 550" do
      FarMar::Market.find(550).must_equal nil
    end

  end

  describe "FarMar::Market#vendors" do
    it "should return 6 vendors associated with market id 1" do
      ven_market.vendors.length.must_equal 6
    end
  end

  describe "FarMar::Market#self.search(search_term)" do
    it "should return 3 markets & vendors for search term 'school'" do
      FarMar::Market.search('school').length.must_equal 3
    end

    it "should return 31 markets & vendors for search term 'wild'" do
      FarMar::Market.search('wild').length.must_equal 13
    end
  end

  describe "FarMar::Market#preferred_vendor" do
    markets4 = FarMar::Market.new(id: 1)
    it "should return vendor with highest revenue for specific market" do
    markets4.preferred_vendor.name.must_equal "Reynolds, Schmitt and Klocko"
    end
  end

  describe "FarMar::Market#worst_vendor" do
    markets5 = FarMar::Market.new(id: 3)
    it "should return vendor with lowest revenue for specific market" do
    markets5.worst_vendor.name.must_equal "Windler Inc"
    end
  end

end
