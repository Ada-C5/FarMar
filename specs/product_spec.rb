
require_relative './spec_helper'
require_relative '../far_mar.rb'

describe FarMar::Product do
  it "will not be nil" do
    FarMar::Product.wont_be_nil
  end


  describe "Product#all" do
    let(:all_products){FarMar::Product.all}

    it "makes an array of all the products" do
      all_products.wont_be_nil
    end

    it "returns an array" do      #want to describe what the method is doing, not what the test is doing
      all_products.class.must_equal(Array)
    end

    it "makes sure that the first element is an instance of a Product/Product object" do
      all_products.first.class.must_equal(FarMar::Product)
    end

    it "returns an array full of FarMar::Product instances" do
      classes = all_products.map { |p| p.class }
      classes.uniq.must_equal [FarMar::Product]
    end
  end


  describe "Product#find" do
    let(:product) {FarMar::Product.find(32)}

    it"makes sure that the id requested matches the id given" do
      product = FarMar::Product.find(32)
      product.product_id.must_equal("32")
    end

    it "knows basic info about a product" do
      product.product_id.must_equal "32"
      product.product_name.must_equal "Disgusted Carrots"
      product.vendor_id.must_equal "11"
    end

    describe "Product#sales" do
      it "makes sure that the assoc_product_id requested matches the product_id given" do
        assoc_sales = FarMar::Product.new({product_id: "32", product_name: "Disgusted Carrots", vendor_id: "11"})
        sales_collection = assoc_sales.sales(32)
        sales_collection.last.product_id.must_equal "32"
          sales_collection.first.product_id.must_equal "32"
      end
    end

    describe "Product#vendor" do
      let(:product) {FarMar::Product.find(32)}
      it "makes sure that when we call market method on the new instance of Vendor we get the correct one" do
        product.vendor.vendor_name.must_equal(vendor_name = "Donnelly-Quigley")
      end
    end

    describe "Product#by_vendor" do
      it "makes sure the vendor_id for the first market in the returned array is correct" do
        FarMar::Product.by_vendor(500)[0].product_id.must_equal("1549")

      end

    end

    #need test for number_of_sales

  end
end 
