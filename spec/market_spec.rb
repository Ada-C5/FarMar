require_relative './spec_helper'

describe FarMar::Market do
  let(:market_instance) {FarMar::Market.new}
  let(:market_class) {FarMar::Market}

  it "is an object we have access to" do
    market_instance.wont_be_nil
  end

  describe "FarMar::Market#vendors" do
    it "will return a vendor with it's market id" do
      market_instance.vendors.must_be_instance_of Array
    end
  end


  describe "FarMar::Market#self.all" do
      it "will return an array of market instances" do
      market_class.all.must_be_instance_of Array
    end
  end

  describe " FarMar::Market#self.find" do
    it "will return a market with id 5" do
      market_class.find(5).must_be_instance_of FarMar::Market
    end
  end
end








# describe FarMar::Market do
#
#   it "is an object we have access to" do
#     FarMar::Market.wont_be_nil
#   end
# end
