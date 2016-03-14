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
