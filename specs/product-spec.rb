require_relative './spec-helper'

describe FarMar::Product do
  it "Does it exist?" do
    FarMar::Product.wont_be_nil
  end
end

describe "Product#all" do
  it "return instances of Product class?" do
    FarMar::Product.all.wont_be_nil
  end
end

describe "Product#all" do
  it "return all instances of Product class?" do
    FarMar::Product.all.length.must_equal(8193)
    # The csv contains 8193 products.
  end
end

describe "Product#find(id)" do
  it "Does it exist?" do
    FarMar::Product.find(1).wont_be_nil
  end
end

describe "Product#find(id)" do
  it "Does it return the found product?" do
    FarMar::Product.find(20).length.must_equal(1)
  end
end
