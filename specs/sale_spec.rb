require_relative 'spec_helper'

describe FarMar::Sale do
  let(:all_sales) { FarMar::Sale.all }
  let(:sale) { FarMar::Sale.find(14) }

  it "exists" do
    FarMar::Sale.wont_be_nil
  end

  it "has data" do
    sale.id.must_equal "14"
    sale.amount.must_equal 4978.0
    sale.purchase_time.must_equal "2013-11-10 01:51:24 -0800"
    sale.vendor_id.must_equal "3"
    sale.product_id.must_equal "4"
  end

  describe "Sale#self.all" do
    it "creates an array of Sale objects" do
      all_sales.must_be_instance_of Array
      all_sales[0].must_be_instance_of FarMar::Sale
    end
  end

  describe "Sale#self.find(find_id)" do
    it "returns the Sale object with matching id" do
      this_id = all_sales[13].id

      ap sale
      sale.must_be_instance_of FarMar::Sale
      sale.id.must_equal this_id
      sale.purchase_time.must_equal "2013-11-10 01:51:24 -0800"
    end
  end

end
