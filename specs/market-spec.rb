require_relative './spec-helper'

describe FarMar::Market do
  it "Does it exist?" do
    FarMar::Market.wont_be_nil
  end
end

describe "Market#all" do
  it "return instances of Market class?" do
    FarMar::Market.all[12].must_be_instance_of FarMar::Market
  end
end

describe "Market#all" do
  it "return all instances of Market class?" do
    FarMar::Market.all.length.must_equal(500)
    # The csv contains 500 markets.
  end
end

describe "Market#find(id)" do
  it "Does it exist?" do
    FarMar::Market.find(1).wont_be_nil
  end
end

describe "Market#find(id)" do
  it "Does it exist?" do
    FarMar::Market.find(20).length.must_equal(1)
  end
end

describe "#vendors" do
  it "Does it return a collection of vendors?" do
    new_market = FarMar::Market.new(market_id: 5)
    new_market.vendors.length.must_equal(2)
  end
end

describe "#vendors" do
  it "Are the items in the collection instances of FarMar::Vendor?" do
    new_market = FarMar::Market.new(market_id: 5)
    new_market.vendors[0].must_be_instance_of FarMar::Vendor
  end
end
