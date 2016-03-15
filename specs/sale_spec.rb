require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Sale do
  # make sure there is a sale class
  it "Is there a class? Anything?" do
    FarMar::Sale.wont_be_nil
  end

  # test self.all method
  it "does self.all return an array and can it grab the purchase_time?" do
    markets = FarMar::Sale.all
    markets.class.must_equal Array
    markets[3].purchase_time.must_equal "2013-11-06 20:44:00 -0800"
  end

  # test the find(id) method
  it "returns the right sale according to id?" do
    FarMar::Sale.find(4).sale_id.must_equal 4
  end

  # test the vendor method
  it "returns the vendor instance related to a sale" do
    sale = FarMar::Sale.all[544]
    sale.class.must_equal FarMar::Sale
    sale.vendor(sale.ven_id).name.must_equal "Schoen-Effertz"
  end

    # test the prodoct method
  it "returns the product instance related to a sale" do
    sale = FarMar::Sale.all[544]
    sale.product(sale.prod_id).class.must_equal FarMar::Product
  end

  # test self.between method
  it "returns array of sale instances with purchase_time in range" do
    FarMar::Sale.between("06:00:00", "08:00:00").length.must_equal 1116
  end
end