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
    FarMar::Vendor.find(5).wont_be_nil
  end
end

describe "Vendor#by_market" do
  it "Does this return a collection of vendors?" do
    FarMar::Vendor.by_market(1).length.must_equal(6)
  end
end

describe "#market" do
  it "Does it return an instance of FarMar::Market?" do
    new_vendor = FarMar::Vendor.new(market_id: 5)
    new_vendor.market(5).must_be_instance_of FarMar::Market
  end
end

describe "#products" do
  it "Does it return a collection of products?" do
    new_vendor = FarMar::Vendor.new(vendor_id: 5)
    new_vendor.products(5).must_be_instance_of Array
  end
end

describe "#products" do
  it "Are the items in the collection instances of FarMar::Product?" do
    new_vendor = FarMar::Vendor.new(vendor_id: 1)
    new_vendor.products(1)[0].must_be_instance_of FarMar::Product
  end
end

describe "#sales" do
  it "Does it return a collection of sales?" do
    new_vendor = FarMar::Vendor.new(vendor_id: 1)
    new_vendor.sales(1).length.must_equal(7)
  end
end

describe "#sales" do
  it "Are the items in the collection instances of FarMar::Sale?" do
    new_vendor = FarMar::Vendor.new(vendor_id: 1)
    new_vendor.sales(1)[0].must_be_instance_of FarMar::Sale
  end
end

describe "#revenue" do
  it "Does this return the total revenue of a given vendor (in cents)?" do
    new_vendor = FarMar::Vendor.new(vendor_id: 1)
    new_vendor.revenue.must_equal(38259)
  end
end
