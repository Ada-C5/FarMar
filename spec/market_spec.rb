require_relative './spec_helper'

describe FarMar::Market do
  let(:market_instance) {FarMar::Market.new}
  let(:market_class) {FarMar::Market}

  it "is an object we have access to" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Market#vendors" do
    it "will return a vendor with it's market id" do
      FarMar::Market.find("3").vendors.pop.must_be_instance_of FarMar::Vendor
    end
  end


  describe "FarMar::Market#self.all" do
      it "will return an array that is greater than 0" do
      (FarMar::Market.all.count > 0).must_equal true
    end
  end

  describe " FarMar::Market#self.find" do
    it "will return a market with id 5" do
      FarMar::Market.find(5).must_be_instance_of FarMar::Market
    end
  end
end








# describe FarMar::Market do
#
#   it "is an object we have access to" do
#     FarMar::Market.wont_be_nil
#   end
# end
