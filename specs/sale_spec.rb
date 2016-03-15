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

      # uncomment the following line to see an an instance of sale with id 14
      # ap sale
      sale.must_be_instance_of FarMar::Sale
      sale.id.must_equal this_id
      sale.purchase_time.must_equal "2013-11-10 01:51:24 -0800"
    end
  end

  describe "Sale#vendor" do
    it "finds the Vendor that the Sale belongs to" do
      # uncomment the following line to see the instance of vendor for this product
      # p sale.vendor
      sale.vendor.must_be_instance_of FarMar::Vendor
      sale.vendor.name.must_equal "Breitenberg Inc"
    end
  end

  describe "Sale#product" do
    it "finds the Product that the Sale belongs to" do
      # uncomment the following line to see the instance of product for this product
      # p sale.product
      sale.product.must_be_instance_of FarMar::Product
      sale.product.name.must_equal "Yummy Fruit"
    end
  end

end
