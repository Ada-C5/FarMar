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

    it "will find the correct instance" do
    sale.amount.must_equal 8486
    end

    it "returns false if it can't find the sale" do
      FarMar::Sale.find(3_000_000).must_equal false
    end
  end

  describe "FarMar::Sale#vendor" do
    it "will not be nil" do
      sale.vendor.wont_be_nil
    end

    it "will return the correct vendor for the sale" do
      sale.vendor.id.must_equal "263"
    end
  end

  describe "FarMar::Sale#product" do
    it "will not be nil" do
      sale.product.wont_be_nil
    end

    it "will return the correct product for the sale" do
      sale.product.id.must_equal "827"
    end
  end

  describe "FarMar::Sale#self.between(beginning_time, end_time)" do
    let (:sale_time_range) { FarMar::Sale.between("2013-11-06", "2013-11-07") }

    it "will not be nil" do
      sale_time_range.wont_be_nil
    end

    it "will return an array" do
      sale_time_range.must_be_instance_of Array
    end

  end
end
