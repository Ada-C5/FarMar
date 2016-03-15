require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Market do

  before do
    happy_market_info = {
      market_id: 10,
      name: "Happy Market"
    }
    @happy_market = FarMar::Market.new(happy_market_info)
  end

  it "does this exist" do
    FarMar::Market.wont_be_nil
  end

  it "creates an array of market instance" do
    FarMar::Market.all.class.must_equal(Array)
  end

  it "creates an instance of FarMar::Market" do
    @happy_market.must_be_instance_of(FarMar::Market)
  end

  describe "self.find" do

     it "should find instance of market with matching id" do
       FarMar::Market.find(1).name.must_equal("People's Co-op Farmers Market")
     end

     it "should return nil when it can't find a matching market id" do
       FarMar::Market.find(2727272727).must_equal(nil)
     end

  end

end
