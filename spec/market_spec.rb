require_relative './spec_helper'

describe FarMar::Market do
  before do
    @market = FarMar::Market.new
  end

  it "is an object we have access to" do
    @market.wont_be_nil
  end
end

describe FarMar::Market do
  before do
  @market = FarMar::Market
  end
  it "will return an array of market instances" do
    @market.all.class.must_equal Array
  end

  it "will return a market with id 5" do
    @market.find(5).must_be_instance_of FarMar::Market
  end

  

end






# describe FarMar::Market do
#
#   it "is an object we have access to" do
#     FarMar::Market.wont_be_nil
#   end
# end
