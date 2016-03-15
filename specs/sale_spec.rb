require_relative './spec_helper'

describe FarMar::Sale do
  it "will not be nil" do
    FarMar::Sale.wont_be_nil
  end
end

describe "FarMar::Sale#self.all" do
  it "will not be nil" do
    FarMar::Sale.all.wont_be_nil
  end
end

describe "FarMar::Sale#self.find(id)" do
  id = 1200
  it "will not be nil" do
    FarMar::Sale.find(id).wont_be_nil
  end
end

describe "FarMar::Sale#self.find(id)" do
  it "will find the correct instance" do
  FarMar::Sale.find(1200).amount.must_equal 8486
  end
end
