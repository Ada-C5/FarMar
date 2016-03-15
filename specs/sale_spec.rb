require_relative 'spec_helper'

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

end
