require_relative './spec_helper'

describe FarMar::Sale do
  let (:sale) { FarMar::Sale.find(1200)}

  it "will not be nil" do
    FarMar::Sale.wont_be_nil
  end

  describe "FarMar::Sale#self.all" do
    it "will not be nil" do
      FarMar::Sale.all.wont_be_nil
    end
  end

  describe "FarMar::Sale#self.find(id)" do
    it "will not be nil" do
      sale.wont_be_nil
    end
  end

  describe "FarMar::Sale#self.find(id)" do
    it "will find the correct instance" do
    sale.amount.must_equal 8486
    end

    it "returns false if it can't find the sale" do
      FarMar::Sale.find(3_000_000).must_equal false
    end
  end
end
