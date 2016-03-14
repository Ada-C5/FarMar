require_relative './spec-helper'

describe FarMar::Vendor do
  it "Does it exist?" do
    FarMar::Vendor.wont_be_nil
  end
end

describe "Vendor#all" do
  it "return instances of Vendor class?" do
    FarMar::Vendor.all.wont_be_nil
  end
end

describe "Vendor#all" do
  it "return all instances of Vendor class?" do
    FarMar::Vendor.all.length.must_equal(2690)
    # The csv contains 2690 vendors.
  end
end

describe "Vendor#find(id)" do
  it "Does it exist?" do
    FarMar::Vendor.find(1).wont_be_nil
  end
end

describe "Vendor#find(id)" do
  it "Does it return the found vendor?" do
    FarMar::Vendor.find(20).length.must_equal(1)
  end
end

describe "#market" do
  it "Does it return an instance of FarMar::Market?" do
    new_vendor = FarMar::Vendor.new(market_id: 5)
    new_vendor.market(5).must_be_instance_of FarMar::Market
  end
end

# describe "#products" do
#   it "Does it return a collection of products?" do
#     new_market = FarMar::Market.new(market_id: 5)
#     new_market.products.length.must_equal(2)
#   end
# end
# 
# describe "#products" do
#   it "Are the items in the collection instances of FarMar::Vendor?" do
#     new_market = FarMar::Market.new(market_id: 5)
#     new_market.products[0].must_be_instance_of FarMar::Vendor
#   end
# end
