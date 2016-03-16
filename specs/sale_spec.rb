require_relative './spec_helper'

describe FarMar::Sale do
  let (:sale) {FarMar::Sale}
  let (:sale_12) {FarMar::Sale.new(id: "12", amount: "5179", purchase_time: "2013-11-08 16:36:03 -0800", vendor_id: "3", product_id: "4")}

  it "should be an object we have access to" do
    sale.wont_be_nil
  end

  describe "FarMar::Sale#all" do
    it "should return an array with instances form csv file" do
      sale.all.class.must_equal Array
    end
  end

  describe "FarMar::Sale#find(id)" do
    it "should return an instance of FarMar::Product for FarMar::Product.find(1)" do
      sale_12.must_be_instance_of FarMar::Sale
    end

    it "should return 'Dry Beets' for instance of FarMar::Product.find(1)" do
      sale_12.id.must_equal "12"
    end
  end

  describe "FarMar::Sales#vendor" do
    it "return FarMar::Vendor instances" do
      vendors = sale_12.vendor.map {|vendor| vendor.class}
      vendors.uniq.must_equal [FarMar::Vendor]
    end
  end
end
