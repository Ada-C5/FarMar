require_relative './spec_helper'
require_relative '../lib/sale'

describe FarMar::Sale do
  it "Sale Class exist?" do
    FarMar::Sale.wont_be_nil
  end

  describe "#self.all(file)" do
    let(:all_sales) { FarMar::Sale.all}

    it "Return an array?" do
      all_sales.must_be_instance_of Array
    end

    it "Return an array full of FarMar::Sale Instances?" do
      classes = all_sales.map { |m| m.class}
      classes.uniq.must_equal [FarMar::Sale]
    end
  end

  describe "#self.find(id)" do
    let(:sale) { FarMar::Sale.find(1) }

    it "Know basic data about sale?" do
      sale.must_be_instance_of FarMar::Sale
      sale.id.must_equal(1)
      sale.amount.must_equal(9290)
      sale.purchase_time.must_equal("2013-11-07 04:34:56 -0800")
      sale.vendor_id.must_equal(1)
      sale.product_id.must_equal(1)
    end

    it "Returns nil if sale is not found?" do
      FarMar::Sale.find(100_000).must_equal(nil)
    end
  end

  # describe "#vendors" do
  #   it "Returns an array of vendor objects that match a specific sale_id" do
  #     market = FarMar::Sale.find(1)
  #     vendors = market.vendors
  #     vendors.length.must_equal(6)
  #   end
  # end

end
