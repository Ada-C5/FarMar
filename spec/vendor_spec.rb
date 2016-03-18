require_relative './spec_helper'

describe FarMar::Vendor do

  it "is an object we have access to" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor#markets" do
      it "will return a market with it's vendor id" do
        FarMar::Vendor.find("3").market.pop.must_be_instance_of FarMar::Market
      end
    end


  describe "FarMar::Vendor#products" do
    it "will return a product with its corresponding product id" do
      FarMar::Vendor.find(5).products.pop.must_be_instance_of FarMar::Product
    end
  end

  describe "FarMar::Vendor#products" do
    it "will return a single vendor with it's corresponding product id" do
      FarMar::Vendor.find("3").products.must_be_instance_of Array
    end

  end

  describe "FarMar::Vendor#sales" do
    it "will return a collection of FarMar::Sale instances associated by the vender_id field" do
      FarMar::Vendor.find("3").sales.pop.must_be_instance_of FarMar::Sale
    end
  end


  describe "FarMar::Vendor#revenue" do
  it "will return the sum of the vendors sales" do
    FarMar::Vendor.find("4").revenue.must_equal 26866
    end
  end


end




  describe "FarMar::Vendor#self.all" do
    it "will return an array of vendor instances" do
      (FarMar::Vendor.all.count > 0).must_equal true
    end
  end

  describe "FarMar::Vendor#self.find" do
    it "will return a vendor with id 5" do
      FarMar::Vendor.find("5").must_be_instance_of FarMar::Vendor
    end
  end


  describe "FarMar::Vendor#self.by_market" do
    it 'will return markets with the given market id' do
    FarMar::Vendor.by_market("4").pop.must_be_instance_of FarMar::Vendor
    end
  end




  # it "will return all the vendors with the given market id" do
  #   vendors = @vendor.by_market("8").map { |vendor| vendor.market_id}
  #   vendors.uniq.must_equal ["8"]
  #
  # end
