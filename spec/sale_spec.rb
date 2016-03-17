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

  describe "#vendor" do
    let(:sale) { FarMar::Sale.find(1) }
    it "Returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field" do
      vendor = sale.vendor
      vendor.must_be_instance_of FarMar::Vendor
    end
  end

  describe "#product" do
    let(:sale) { FarMar::Sale.find(1) }
    it "Returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field" do
      product = sale.product
      product.must_be_instance_of FarMar::Product
    end
  end

  describe "#self.between" do
    it "Returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments" do
      beg_time = DateTime.parse("2013-11-07 04:34:55 -0800")
      end_time = DateTime.parse("2013-11-07 04:34:57 -0800")
      total = FarMar::Sale.between(beg_time, end_time)
      total.must_be_instance_of Array
      total.length.must_equal(1)
    end

    describe "#self.between" do
      it "Returns a collection of FarMar::Sale objects where the purchase time is between a day given as arguments" do
        beg_time = DateTime.parse("2013-11-07 04:34:55 -0800")
        end_time = DateTime.parse("2013-11-08 04:34:55 -0800")
        total = FarMar::Sale.between(beg_time, end_time)
        total.must_be_instance_of Array
        total.length.must_equal(1809)
      end
    end
  end




end
