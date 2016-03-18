require_relative './spec_helper'

describe FarMar::Product do
  let (:product) { FarMar::Product} #instance of class
  let (:product_3) { FarMar::Product.find(3) }
  let (:product_5) { FarMar::Product.new(["5", "Green Apples", "4"])} # specific instance

  it "should be an object we have access to" do
    product.wont_be_nil
  end

  describe "FarMar::Product#all" do
    it "should return an array of instances from products.csv file" do
      product.all.class.must_equal Array
    end
  end

  describe "FarMar::Product#find(id)" do
    it "should return an instance of FarMar::Product for given a product id" do
      product_5.class.must_equal FarMar::Product
    end

    it "returns information on FarMar::Product.find(3)" do
      # 3,Heavy Chicken,2
      product_3.id.must_equal 3
      product_3.name.must_equal "Heavy Chicken"
      product_3.vendor_id.must_equal 2
    end
  end

  # using FarMar::Product.vendor_id to match FarMar::Vendor.id
  describe "FarMar::Product#vendor" do
    it "returns the FarMar::Vendor instance that is associated with vendor" do
      vendors = product_5.vendor.map {|vendor| vendor.class}
      vendors.uniq.must_equal [FarMar::Vendor]
    end
  end

  # using FarMar::Product.id to match FarMar::Product.product_id
  describe "FarMar::Product#sales" do
    it "returns a collection of FarMar::Sale instances that match market instance" do
      total_sales = product_5.sales.map {|sales| sales.class }
      total_sales.uniq.must_equal [FarMar::Sale]
    end
  end

  describe "FarMar::Product#number_of_sales" do
    it "returns the number of times product has been sold" do
      total_sales = product_5.number_of_sales
      total_sales.class.must_equal Fixnum
    end
  end

  describe "FarMar::Product.by_vendor(vendor_id) self.class" do
    it "returns an array of all the products" do
      product.by_vendor("5").class.must_equal Array
    end

    it "returns all the products with given vendor_id" do
      product_list = product.by_vendor(5).map {|product| product.vendor_id}
      product_list.uniq.must_equal [5]
    end

  end
end
