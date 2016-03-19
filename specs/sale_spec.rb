require_relative './spec_helper'

describe FarMar::Sale do
  let (:sale) {FarMar::Sale}
  let (:sale_12) {FarMar::Sale.new(["12", "5179", "2013-11-08 16:36:03 -0800", "3", "4"])}

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
      sale.find("12").must_be_instance_of FarMar::Sale
    end

    it "should return 'Dry Beets' for instance of FarMar::Product.find(1)" do
      sale_12.id.must_equal 12
    end
  end

  describe "FarMar::Sales#vendor" do
    it "return FarMar::Vendor instances" do
      vendors = sale_12.vendor.map {|vendor| vendor.class}
      vendors.uniq.must_equal [FarMar::Vendor]
    end
  end

  # FarMar::Sale. product_id == FarMar::Product.id
  describe "FarMar::Sales#product" do
    it "returns FarMar product instances that correspond with a sales instance" do
      product_list = sale_12.product.map {|product| product.class}
      product_list.uniq.must_equal [FarMar::Product]
    end
  end

  describe "FarMar::Sales#self.between(beginning_time, end_time)" do
    it "should return a collection of FarMar::Sale instances" do
      sale_result = sale.between("2013-11-12 06:03:54 -0800", "2013-11-12 01:22:56 -0800")
      sale_result.wont_be_nil
    end

    it "return an array with of instances that fit the range" do
      sale_result = sale.between("2013-11-08 16:36:03 -0800", "2013-11-12 01:22:56 -0800")
      sale_result.class.must_equal Array
    end

    it "return a specific instance in that range" do
      sale_result = sale.between("2013-11-08 16:36:03 -0800", "2013-11-09 01:22:56 -0800")
      sale_result_select = sale_result.select {|sale| sale.purchase_time == Time.parse("2013-11-08 16:36:03 -0800")}
      sale_result_select.wont_be_nil
    end
  end

  describe "FarMar::Sale#vendor_with_highest_revenue_in SELF METHOD" do
    it "returns the vendor with the highest revenue in given date range" do
      vendor = sale.vendor_with_highest_revenue_in("2013-11-08 16:36:03 -0800", "2013-11-09 01:22:56 -0800")
      vendor.class.must_equal Array
    end
    #
    # it "returns the vendor with the highest revenue in given date range" do
    #   vendor = sale.vendor_with_highest_revenue_in("2013-11-08 16:36:03 -0800", "2013-11-09 01:22:56 -0800")
    #   vendor[0].must_equal Array
    #
    # end
    #
    # it "returns the vendor with the highest revenue in given date range" do
    #   vendor = sale.vendor_with_highest_revenue_in("2013-11-08 16:36:03 -0800", "2013-11-09 01:22:56 -0800")
    #   vendor[1].must_equal Array
    # end

  end

  # describe "FarMar::Sales#self.between_hour(beginning_time, end_time)" do
  #   it "should return a collection of FarMar::Sale instances" do
  #     sales = sale.between_hour("2013-11-12 06:03:54 -0800", "2013-11-12 01:22:56 -0800")
  #     sales_result = sales.minmax_by {|sale| sale.purchase_time.hour}
  #     [sales_result[0].purchase_time.hour, sales_result[1].purchase_time.hour].must_equal Fixnum
  #   end
  # end
end
