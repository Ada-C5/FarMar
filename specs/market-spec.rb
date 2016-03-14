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
    FarMar::Market.all.length.must_equal(2)
  end
end
