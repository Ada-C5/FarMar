require_relative './spec-helper'

describe FarMar::Sale do
  it "Does it exist?" do
    FarMar::Sale.wont_be_nil
  end
end

describe "Sale#all" do
  it "return instances of Sale class?" do
    FarMar::Sale.all.wont_be_nil
  end
end

describe "Sale#all" do
  it "return all instances of Sale class?" do
    FarMar::Sale.all.length.must_equal(12798)
    # The csv contains 12798 saless.
  end
end

describe "Sale#find(id)" do
  it "Does it exist?" do
    FarMar::Sale.find(1).wont_be_nil
  end
end

describe "Sale#find(id)" do
  it "Does it return the found sale?" do
    FarMar::Sale.find(20).length.must_equal(1)
  end
end
