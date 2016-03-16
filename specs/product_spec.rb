require_relative "./spec_helper"
require_relative "../far_mar"
#require_relative "../farmar_product"

describe FarMar::Product do
  it "it is an object we have acccess to" do
    FarMar::Product.wont_be_nil
  end
end

describe "FarMar#Product" do

  before do
    market_data = {
      product_id: 24,
      product_name: "apple"
    }
    @product = FarMar::Product.new(market_data)
  end

      it "an instance of class Product'" do
    	 @product.must_be_instance_of(FarMar::Product)
      end

      describe "FarMar::Product#all" do
        it "should return number of all products" do
          all_products = FarMar::Product.all
          all_products.length.must_equal 8193
        end
      end

      describe "FarMar::Product#find" do
        it "should return information for particular product" do
          selected_product = FarMar::Product.find(5)
          selected_product.product_name.must_equal "Green Apples"
        end

        it "should return an array for product" do
          FarMar::Product.find(77).vendor.must_be_instance_of Array
        end
      end

      describe "FarMar::Product#vendor" do
        it "returns the FarMar::Vendor instance associated with this vendor using the FarMar::Product vendor_id field(77)" do
          selected_vendor = FarMar::Product.find(77)
          selected_vendor.vendor[0].name.must_equal "Schmitt Group"
        end
      end

      describe "FarMar::Product#sales" do
        it "returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field(77)" do
          selected_product = FarMar::Product.find(77)
          selected_product.sales[0].vendor_id.must_equal 26
        end
      end

      describe "FarMar::Product#by_market" do
        it "returns all of the products with the given vendor_id" do
          FarMar::Vendor.by_market(56).length.must_equal 5
        end
      end
end
