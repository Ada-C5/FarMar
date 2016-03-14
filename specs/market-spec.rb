require_relative './spec-helper'

describe FarMar::Market do
  it "Does it exist?" do
    FarMar::Market.wont_be_nil
  end
end

describe "Market#all" do
  it "return instances of Market class?" do
    FarMar::Market.all.wont_be_nil
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
