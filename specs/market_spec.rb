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
      ven_market.vendors(1).length.must_equal 6
    end
  end

end
