require_relative 'spec_helper'
require 'date'
require 'time'

describe FarMar::Sale do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Sale.wont_be_nil
  end

  let(:sales_all) {FarMar::Sale.all}
  let(:sales_find) {FarMar::Sale.find 1}

    # runs the .all method to create instances for each row in products.csv
    it "returns total number of sales => 12798 instances" do
      sales_all.length.must_equal 12798 # checks the length
    end

    # check the .find(id) method
    it "verifies the .find(id = 1) with info from line 1 in csv (id = 1) " do
      sal = sales_find
      sal.id.must_equal 1
      sal.amount.must_equal 9290
      sal.purchase_time.must_equal %q[2013-11-07 04:34:56 -0800]
      sal.vendor_id.must_equal 1
      sal.product_id.must_equal 1
    end

    # checks the vendor method
    it "verifies the vendor is associated with sale_id: 1" do
      sal_ven = sales_find.vendor
      sal_ven.id.must_equal 1
      sal_ven.name.must_equal "Feil-Farrell"
      sal_ven.employees.must_equal 8
      sal_ven.market_id.must_equal 1
    end

    # checks the product method
    it "should check first sale (/1) associated with the sales id: 1" do
      sal_pro = sales_find.product[0]
      sal_pro.id.must_equal 1
      sal_pro.name.must_equal "Dry Beets"
      sal_pro.vendor_id.must_equal 1 # it matches!
    end

    # checks DateTime
    it "should check the date" do
      FarMar::Sale.between('2013-11-09 22:35:57 -0800','2013-11-09 22:38:00 -0800').length.must_equal 3

    end


end
